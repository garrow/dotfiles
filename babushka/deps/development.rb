dep 'development' do
  requires 'python'
end


dep 'postgresql.bin' do
  provides 'psql'
end

dep 'python' do
  requires 'python.bin', 'python-psycopg2.lib', 'pylint.bin'
end

dep 'python.bin'
dep 'pylint.bin'
dep 'python-psycopg2.lib'


dep 'php' do

  requires 'php5-cli.lib'
end


  dep 'php5-cli.lib'

# postgresql-contrib
# pgadmin3
# subversion
# libreadline6-dev
