
alias g=git
alias gs='git status'
alias gse='git status --ignored'
alias gsl='git log --pretty="format:%Cblue%h%d%Creset %ar %Cgreen%an%Creset %s" --graph'
alias gr='gsl -n 10'
alias gra='gr --all'
alias gd='git diff'
alias gds='git diff --color --staged '
alias gap='git add --patch'
alias grp='git reset --patch'
alias gcp='git checkout --patch'
alias gvp=gcp

alias __git_clean_branch_list="git branch  --color=never |tr -d '*'"
alias cob=__git_checkout_branch_menu
alias com='git checkout master'
alias gmod='git status --porcelain |cut -c4-'

# TODO - Ensure this can handle detached HEAD states.

__git_checkout_branch_menu()
{
PS3="Select a branch or Ctrl+C to cancel: "
select opt in $(__git_clean_branch_list); do git checkout ${opt}; break;	done
}

