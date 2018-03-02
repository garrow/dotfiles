#!/bin/bash
alias g=git
# Status
alias gs='git status'
alias gse='git status --ignored'
# Logs
alias gsl='git log --pretty="format:%Cblue%h%d%Creset %ar %Cgreen%an%Creset %s"'
alias gr='gsl -n 10' # Git Recent
alias gra='gr --all'

# Commit
alias git-save="git commit --no-verify -m WIPWIPWIP"

# Diff
alias gd='git diff --color'
alias gds='git diff --color --staged '

# Operate Patchwise (Interactively)
alias gap='git add --patch'
alias grp='git reset --patch'
alias gcp='git checkout --patch'
alias gvp=gcp
alias gsp='git stash save --patch'

# Changed files
alias __git_current_branch='git rev-parse --abbrev-ref HEAD'
alias __git_current_branch_revisions='git rev-list $(__git_current_branch) ^master'
alias __git_current_branch_changed_files='git diff --name-only $(git merge-base HEAD master)..$(__git_current_branch)'
alias __git_current_branch_changes='git diff $(git merge-base HEAD master)..$(__git_current_branch)'
alias gbc=__git_current_branch_changed_files
alias gbd=__git_current_branch_changes

alias __git_modified_files="git diff HEAD --name-only"
alias __git_new_files="git ls-files -o --exclude-standard"
alias gmod=__git_modified_files
alias gnew=__git_new_files

alias __git_undo_whitespace_changes="git diff -b --numstat | egrep $'^0\t0\t' | cut -d$'\t' -f3- | xargs git checkout HEAD --"

# Branch management
alias gpushnew='git push --set-upstream origin $(__git_current_branch)'
alias __git_prune_merged_branches='git checkout master && git branch --merged |grep -v "\*" | grep -v master |grep -v stable | xargs -n1 git branch -d'

alias cob=__git_checkout_branch_menu
alias cow=__git_checkout_working_branches_menu
alias cor=__git_checkout_remote_branch_menu
alias com='git checkout master'

alias __git_branch_list="git branch --list --color=never"
alias __git_local_branch_list="git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)'"
alias __git_working_branch_list="__git_branch_list --no-merged |tr -d ' *' | grep -v '(no branch)'"
alias __git_remote_branch_list="__git_branch_list --remotes | grep -v 'origin/master' | cut -d/ -f 2-"
alias __git_only_remote_branch_list="cat  <(__git_local_branch_list) <(__git_local_branch_list) <(__git_remote_branch_list) |sort |uniq -u"

#alias __git_delete_all_remote_merged_branches="git branch --list --color=never --remotes --merged origin/master | grep -v master | grep -v stable  |cut -d/ -f2- | xargs -n1  git push origin --delete"

__git_checkout_branch_menu()
{

PS3="Select a branch or Ctrl+C to cancel: "
if [ $# -eq 1 ]; then
  select opt in $(__git_local_branch_list |grep --color=never "$@"); do git checkout "${opt}"; break; done
else
  select opt in $(__git_local_branch_list); do git checkout "${opt}"; break; done
fi
}

__git_checkout_working_branches_menu()
{
PS3="Select a branch or Ctrl+C to cancel: "
if [ $# -eq 1 ]; then
  select opt in $(__git_working_branch_list |grep --color=never "$@"); do git checkout "${opt}"; break; done
else
  select opt in $(__git_working_branch_list); do git checkout "${opt}"; break; done
fi
}

__git_checkout_remote_branch_menu()
{

PS3="Select a branch or Ctrl+C to cancel: "
if [ $# -eq 1 ]; then
  select opt in $(__git_only_remote_branch_list |grep --color=never "$@"); do git checkout "${opt}"; break; done
else
  select opt in $(__git_only_remote_branch_list); do git checkout "${opt}"; break; done
fi
}

__git_commit_splat()
{
  TEMP_FILE=$(mktemp '/tmp/git.simplecommit.msg.XXXX')
  echo "# $*" >> "$TEMP_FILE"
  git commit --edit --verbose --file "$TEMP_FILE"
  rm -f "$TEMP_FILE"
}

alias gcm=__git_commit_splat

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

  scope_types=$(find app lib -type d -maxdepth 1 -mindepth 1 | xargs -n 1 | cut -f 2 -d/ |sort -u)

  PS3="Select type: "
  select opt in "${fix_types[@]}"; do
    type=$( echo $opt | cut -f 1 -d' ');
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

  __git_commit_splat "[${type}][${scope}]" $@
}

alias gcf=__git_commit_fame
alias gup='git up'
