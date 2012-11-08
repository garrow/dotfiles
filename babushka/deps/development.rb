require './dep_helper'

dep 'development' do
  requires 'python', 'graphviz.lib', 'git_tools', 'utils'
end


dep 'postgresql.bin' do
  provides 'psql'
end

dependency_package 'python', %w[python.bin python-psycopg2.lib pylint.bin]

dependency_package :php, %w[php5-cli.lib]
dependency_package :git_tools, %w[gitg.bin]

dependency_package :utils, %w[meld.bin]


dep 'graphviz.lib'



# postgresql-contrib
# pgadmin3
# subversion
# libreadline6-dev
