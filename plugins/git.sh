alias g=git
alias gs='git status'
alias gse='git status --ignored'
alias gsl='git log --pretty="format:%Cblue%h%d%Creset %ar %Cgreen%an%Creset %s" --graph'
alias gr='gsl -n 10' # Git Recent
alias gra='gr --all'

# Diff
alias gd='git diff'
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
alias __git_current_branch_changed_files='git show --pretty="format:" --name-only $(__git_current_branch_revisions)..master |sort -u'
alias gbc=__git_current_branch_changed_files

alias __git_modified_files="git diff --name-status |grep -v '^D' | tr -s '\t' |cut -f2"
alias gmod=__git_modified_files

alias __git_undo_whitespace_changes="git diff -b --numstat | egrep $'^0\t0\t' | cut -d$'\t' -f3- | xargs git checkout HEAD --"

# Branch management
alias gpushnew='git push --set-upstream origin $(__git_current_branch)'
alias __git_prune_merged_branches='git branch --merged | grep -v master | xargs -n1 git branch -d'

alias cob=__git_checkout_branch_menu
alias cow=__git_checkout_working_branches_menu
alias cor=__git_checkout_remote_branch_menu
alias com='git checkout master'

alias __git_branch_list="git branch --list --color=never"
alias __git_local_branch_list="__git_branch_list |tr -d ' *' | grep -v '(no branch)'"
alias __git_working_branch_list="__git_branch_list --no-merged |tr -d ' *' | grep -v '(no branch)'"
alias __git_remote_branch_list="__git_branch_list --remotes | grep -v 'origin/master' | cut -d/ -f 2-"
alias __git_only_remote_branch_list="cat  <(__git_local_branch_list) <(__git_local_branch_list) <(__git_remote_branch_list) |sort |uniq -u"

__git_checkout_branch_menu()
{

  PS3="Select a branch or Ctrl+C to cancel: "
if [ $# -eq 1 ]; then
  select opt in $(__git_local_branch_list |grep --color=never "$@"); do git checkout ${opt}; break; done
else
  select opt in $(__git_local_branch_list); do git checkout ${opt}; break; done
fi
}

__git_checkout_working_branches_menu()
{
PS3="Select a branch or Ctrl+C to cancel: "
select opt in $(__git_working_branch_list); do git checkout ${opt}; break; done
}
__git_checkout_remote_branch_menu()
{
PS3="Select a branch or Ctrl+C to cancel: "
select opt in $(__git_only_remote_branch_list); do git checkout ${opt} ; break; done
}
