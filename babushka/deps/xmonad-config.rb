

dep 'xmonad-config', :from, :path do
  from.default!("git@github.com:garrow/xmonad.git")
  #from.default!("https://github.com/benhoskings/babushka.git")

  requires 'ruby', 'git'
  setup {
    unmeetable! "The current user, #{shell('whoami')}, can't write to #{repo.path}." unless repo.path.hypothetically_writable?
  }
  met? { repo.exists? }
  meet {
    log_block "Cloning #{from} into #{repo.path}" do
      repo.clone! from
    end
  }
end
