alias g=git
function git-current-branch() { git rev-parse --abbrev-ref HEAD; }

## Support repos with different main/master branches.
## used to support the `com` quick change to main branch.
function __git_main_branch() {
  local current_main_branch=`git branch --remote --points-at origin/HEAD --format "%(symref:lstrip=3)"|head -n1`

  if [ "$current_main_branch" ]; then
    echo $current_main_branch
  else
    # Test me by running `git remote set-head origin --delete`
    echo "!!! Failed to find remote origin/HEAD main branch, attempting to auto-detect from remote."
    git remote set-head origin --auto
  fi
}


# Status
alias gs='git status'
alias gse='git status --ignored'

# Logs
alias gsl='git log --pretty="format:%Cblue%h%d%Creset %ar %Cgreen%an%Creset %s"'
alias gr='gsl -n 10' # Git Recent
alias gra='gr --all'

# Committing
alias git-save="git commit --no-verify -m WIPWIPWIP"
alias gcm=__git_commit_splat

__git_commit_splat()
{
  TEMP_FILE=$(mktemp '/tmp/git.simplecommit.msg.XXXX')
  echo "# $*" >> "$TEMP_FILE"
  git commit --edit --verbose --file "$TEMP_FILE"
  rm -f "$TEMP_FILE"
}

# Diff
alias gd='git diff --color'
alias gds='git diff --color --staged '

# Operate Patchwise (Interactively)
alias gap='git add --patch'
alias grp='git reset --patch'
alias gcp='git checkout --patch'
alias gvp=gcp
alias gsp='git stash save --patch'

# Remote
alias gup='git up; echo "PRUNE"; __git_prune_automagic'
alias gpushnew='git push --set-upstream origin $(git-current-branch)'
alias __git_prune_merged_branches='git checkout $(__git_main_branch) && git branch --merged |grep -v "\*" | grep -v $(__git_main_branch) |grep -v stable | xargs -n1 git branch -d'

# Changed files
alias __git_current_branch_revisions='git rev-list $(git-current-branch) ^$(__git_main_branch)'
alias __git_current_branch_changed_files='git diff --name-only $(git merge-base HEAD $(__git_main_branch))..$(git-current-branch)'
alias __git_current_branch_changes='git diff $(git merge-base HEAD $(__git_main_branch))..$(git-current-branch)'
alias gbc=__git_current_branch_changed_files
alias gbd=__git_current_branch_changes

alias __git_modified_files="git diff HEAD --name-only"
alias __git_new_files="git ls-files -o --exclude-standard"
alias gmod=__git_modified_files
alias gnew=__git_new_files

# shellcheck disable=SC1117
alias __git_undo_whitespace_changes="git diff -b --numstat | egrep $'^0\t0\t' | cut -d$'\t' -f3- | xargs git checkout HEAD --"

# Branch management
alias com='git checkout $(__git_main_branch)'
alias cob="__git_checkout_branch_menu '__git_local_branch_list'"
alias cow="__git_checkout_branch_menu '__git_working_branch_list'"
alias cor="__git_checkout_branch_menu '__git_only_remote_branch_list'"

# Given the name of a function which returns a list of branch names and an optional string to filter that list,
# present the user a menu, allowing fast branch selection.
__git_checkout_branch_menu()
{
  local branch_fetch_list_command="$1"
  local filter_string="$2"

  PS3="Select a branch or Ctrl+C to cancel: "
  if [ "$filter_string" ]; then
    select opt in $($branch_fetch_list_command |grep --color=never "$filter_string"); do git checkout "${opt}"; break; done
  else
    select opt in $($branch_fetch_list_command); do git checkout "${opt}"; break; done
  fi

  echo ""
}

function __git_local_branch_list()   { git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)' ; }
function __git_working_branch_list() { git branch --list --color=never --no-merged |tr -d ' *' | grep -v '(no branch)'; }
function __git_remote_branch_list()  { git branch --list --color=never --remotes | grep -v 'origin/$(__git_main_branch)' | cut -d/ -f 2-; }
function __git_only_remote_branch_list() {
  cat  <(__git_local_branch_list) <(__git_local_branch_list) <(__git_remote_branch_list) |sort |uniq -u
}

function __git_prune_automagic()
{
  echo "Auto-pruning Git merged branches"
  echo "Ctrl+C to cancel"
  sleep 2
  echo "Merged Branches"
  __git_prune_merged_branches
  echo "Orphan Branches"
  git-branch-delete-orphans
}


# LEGACY

__git_commit_fame()
{
  fix_types=(
    "feat  : feature"
    "fix   : bug fix"
    "main  : maintenance"
    "tweak : not quite a feature, not quite maintenance"
    "copy  : update to site copy"
    "docs  : documentation"
    "style : formatting"
    "ref   : refactoring code"
    "test  : adding missing tests"
  )

  scope_types=$(find app lib -type d -maxdepth 1 -mindepth 1 -print0 | xargs -0 -n 1 | cut -f 2 -d/ |sort -u)

  PS3="Select type: "
  select opt in "${fix_types[@]}"; do
    type=$( echo "$opt" | cut -f 1 -d' ');
    break;
  done
  echo

  PS3="Select scope: "
  select opt in "${scope_types[@]}"; do
    if [ ! "$opt" = "" ]; then
      scope=$opt
    else
      scope=$REPLY
    fi
    break;
  done

  echo "$type"
  echo "$scope"

  __git_commit_splat "[${type}][${scope}]" "$@"
}

alias gcf=__git_commit_fame


function git_branches_cool_list()
{
  git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'
}
alias gbl=git_branches_cool_list
