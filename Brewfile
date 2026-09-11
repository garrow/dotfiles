module CustomBrewfile
  def self.load_nested_brewfile(path, binding_scope)
    here = File.dirname(__FILE__)
    self.load_custom_brewfile(File.expand_path(path, here), binding_scope)
  end

  def self.load_custom_brewfile(path, binding_scope)
    unless  File.exist? path
      puts "💥 MISSING CustomBrewfile: #{path}"
      return
    end

    puts "✅ CustomBrewfile #{path}"
    self._dangerously_eval(path, binding_scope)
  end

  def self._dangerously_eval(full_path, binding_scope)
    contents = IO.read(full_path)
    binding_scope.eval(contents)
  end
end



CustomBrewfile.load_nested_brewfile('./install/homebrew/command-line.Brewfile', binding)
CustomBrewfile.load_nested_brewfile('./install/homebrew/gui-apps.Brewfile', binding)
CustomBrewfile.load_nested_brewfile('./install/homebrew/mac-app-store.Brewfile', binding)
# CustomBrewfile.load_nested_brewfile('Brewfile-mini', binding)