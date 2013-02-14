alias __git_clean_branch_list="git branch --list --color=never |tr -d '*'"
alias cob=__git_checkout_branch_menu

__git_checkout_branch_menu()
{
PS3="Select a branch or Ctrl+C to cancel: "
select opt in $(__git_clean_branch_list); do git checkout ${opt}; break;	done
}

