alias prview="gh pr view"

function newpr() {
  pr_template_file=".github/PULL_REQUEST_TEMPLATE.md"

  if [ -e $pr_template_file ]; then
    hub pull-request  -F $pr_template_file
  else
    hub pull-request
  fi
}


function quick_pr(){
  local pr_file=$(mktemp -t NEW_PR)
  local __git_current_branch=$(git rev-parse --abbrev-ref HEAD)

  git log --pretty="%s" -n 1 > ${pr_file}
  echo "Creating new PR for branch [ ${__git_current_branch} ]"
  git push --set-upstream origin ${__git_current_branch}
  cat $pr_file

  hub pull-request -F ${pr_file}
}