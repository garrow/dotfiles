require './dep_helper'

bin_libs = %w{ack-grep curl colordiff csvtool dos2unix realpath vim xclip screen tree}.collect {|lib| "#{lib}.bin" }

dependency_package 'terminal', bin_libs
