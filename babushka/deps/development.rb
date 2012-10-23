require './dep_helper'

dep 'development' do
  requires 'python', 'graphviz.lib', 'git_tools'
end


dep 'postgresql.bin' do
  provides 'psql'
end

dependency_package 'python', %w[python.bin python-psycopg2.lib pylint.bin]

dependency_package :php, 'php5-cli.lib'
dependency_package :git_tools, 'gitg.bin'


dep 'graphviz.lib'



# postgresql-contrib
# pgadmin3
# subversion
# libreadline6-dev
