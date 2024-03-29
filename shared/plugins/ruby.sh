#export RUBY_GC_MALLOC_LIMIT=90000000
#export RUBY_FREE_MIN=200000
#export RUBY_GC_HEAP_FREE_SLOTS=200000

#export BUNDLE_JOBS=8

alias spec="time rspec"
alias be="bundle exec"
alias rserve='ruby -run -e httpd -- --port 8000 .'

alias rbcop=rubocop
alias rubocop_change='gbc | grep rb | only_files | xargs rubocop'