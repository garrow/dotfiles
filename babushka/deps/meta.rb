dep 'env' do
  requires 'desktop-environment'
end

dep 'desktop-environment' do
	requires 'terminal', 'desktop', 'development'
end