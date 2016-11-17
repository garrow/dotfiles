function newpr() {
  pr_template_file=".github/PULL_REQUEST_TEMPLATE.md"

  if [ -e $pr_template_file ]; then
    hub pull-request  -F $pr_template_file
  else
    hub pull-request
  fi
}
