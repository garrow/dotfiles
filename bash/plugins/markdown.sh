#!/bin/bash
github_markdown_template_file="${bash_bash_env_path:?}/plugins/tp-markdown.html"

function github_markdown()
{
   pandoc --from markdown_github --to html --template "$github_markdown_template_file" "$@"
}

function premailer()
{
  python -m premailer --disable-validation  --remove-star-selectors
}

function target_process_html()
{
  github_markdown "$@" | premailer | pbcopy
}
