alias extras="vim ~/.extras.rc.sh"


alias mos="cd ~/work/code/mos/mos/"
alias mof="cd ~/work/mid-office/mos-requirements"
alias mdb='psql mos_development'
alias piit='cd ~/Dropbox/learn/uni2013/2015/ICT80008'

alias emulate_production='cp config/settings/production.yml config/settings/development.yml'

alias tdl='tail -f log/development.log'

alias deps="cd ~/.babushka/deps"
alias todo="vim ~/todo.txt"
alias mmod='gmod | spelunk'


alias unload_pg='launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'
alias stop_pg='pg_ctl stop -D /usr/local/var/postgres'


alias fame="cd ~/fame/"
alias fw="cd ~/fame/website"
alias fdb="psql fame_website_development"
alias reset_fame_database="pg_restore -d fame_website_development --clean ~/fame/data/database_backups/development/fame_website_development_clean.pgdump"

alias findd='find . -type d |grep -i'


alias clip64='pbpaste | base64 | pbcopy'
