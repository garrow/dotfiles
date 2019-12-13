#!/bin/bash
export RUBY_GC_MALLOC_LIMIT=90000000
export RUBY_FREE_MIN=200000
export RUBY_GC_HEAP_FREE_SLOTS=200000

export BUNDLE_JOBS=8

alias spec="time rspec"
alias be="bundle exec"
alias rserve='ruby -run -e httpd -- --port 8000 .'
alias rake='echo "Wrapped in bundle exec. Use $(which rake) to unwrap"; bundle exec rake'
alias guard='echo "Wrapped in bundle exec. Use $(which guard) to unwrap"; bundle exec guard'
