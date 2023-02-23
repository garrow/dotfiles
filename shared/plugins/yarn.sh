alias ytw=__yarn_test_watch
function __yarn_test_watch
{
  __set_iterm_tab_color 52 204 45
  __set_iterm_jobname 'yarn test --watch'
  yarn test --watch
  __reset_iterm_defaults
}


alias yd=__yarn_dev
function __yarn_dev
{
  __set_iterm_tab_color 52 45 204
  __set_iterm_jobname 'yarn dev'
  yarn dev
  __reset_iterm_defaults
}