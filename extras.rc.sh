alias extras="vim ~/.extras.rc.sh"


alias mos="cd ~/work/code/mid_office_system"
alias cbt="cd ~/work/code/cbt"
alias sp="cd ~/work/code/smartpoint"
alias tmp="cd ~/work/code/travel_management_platform"
alias mof="cd ~/work/mid-office/mos-requirements"
alias mdb='psql mapping_lighting_development'
alias piit='cd ~/Dropbox/learn/uni2013/2015/ICT80008'
alias insight='cd /Users/garrow/work/code/insight'
alias maven=mvn
alias bgop="cd /Users/garrow/Dropbox/work/code/bgop"

alias emulate_production='cp config/settings/production.yml config/settings/development.yml'

alias tdl='tail -f log/development.log'

alias deps="cd ~/.babushka/deps"
alias todo="vim ~/todo.txt"
alias mmod='gmod | spelunk'

# Obsoleted by brew services
alias stop_pg='pg_ctl stop -D /usr/local/var/postgres'


alias fame="cd ~/fame/"
alias fw="cd ~/fame/website"
alias fdb="psql fame_website_development"
alias reset_fame_database="pg_restore -d fame_website_development --clean ~/fame/data/database_backups/development/fame_website_development_clean.pgdump"

alias findd='find . -type d |grep -i'

alias cop='git checkout stable'
alias cut_release='git merge master --ff-only && git tag `date +v%Y-%m-%d-T%H%M%S%z`'

alias clip64='pbpaste | base64 | pbcopy'


alias hstart="/usr/local/Cellar/hadoop/2.7.2/sbin/start-dfs.sh;/usr/local/Cellar/hadoop/2.7.2/sbin/start-yarn.sh"
alias hstop="/usr/local/Cellar/hadoop/2.7.2/sbin/stop-yarn.sh;/usr/local/Cellar/hadoop/2.7.2/sbin/stop-dfs.sh"
