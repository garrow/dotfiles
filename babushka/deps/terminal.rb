require './dep_helper'

bin_libs = %w{ack-grep curl colordiff csvtool dos2unix realpath vim xclip screen tree}.collect {|lib| "#{lib}.bin" }

dependency_package 'terminal', bin_libs + ['entr']

dep 'libkqueue-dev.lib'

dep "entr", :template => "src" do
  requires 'libkqueue-dev.lib'
  source 'http://static.eradman.com/code/entr-1.7.tar.gz'
  preconfigure { true }
  configure { true }
  build { shell "make test -f Makefile.linux" }
  install { sudo "make install" }
end
