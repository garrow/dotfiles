# encoding: utf8 


ELIPSIS = '…'
ABBREVIATION = "॰" 

CACHE_PATH = File.join( ENV['HOME'], ".nicepath.cache")

def nicer path_string

  require 'fileutils'
  path_string.gsub!(ENV['HOME'], '~')

  elements = path_string.split('/')
  simpler_elements = []

  elements.each_with_index do |item, idx|
    # puts item
	# Ignore first, last and any path fragment shorter than 5 chars.
    if idx == 0 || idx == elements.length() -1 || item.length < 5
      simpler_elements << item
      next
    end

    substring = item.slice(0,3) # 1.8.7 compat
    search_path =  File.join( elements[0..idx-1], substring +'*')

    paths = Dir[File.expand_path(search_path.to_s)]

    if paths.count == 1
      simpler_elements << substring + ELIPSIS
    else 
      simpler_elements << item
    end
  end

  File.join(simpler_elements).gsub(ENV['HOME'], '~')
end

def cached path
  
  begin
	cache = Marshal::load(File.read(CACHE_PATH))
  rescue ArgumentError
    cache = {} 
  end
	unless cache.key? path 
		cache[path] = nicer path
		File.open(CACHE_PATH, "w") do |f|
			f.print(Marshal::dump(cache))
		end
	end
	cache[path]
end




ARGF.each_line do |line|
  puts cached line
  break
end

