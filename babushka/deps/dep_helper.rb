def dependency_package name, deps
  deps.each { |d|
    dep d
  }
  dep name.to_s do
    requires *deps
  end
end
