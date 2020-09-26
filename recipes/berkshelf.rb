# Test all required gems and libraries are installed
begin
  require 'berkshelf'
rescue LoadError
  warn 'Required gems and libraries need to be installed this run'
  return 1
end

# Create a bin symlink so Berkshelf can be used on the command line
link '/usr/local/bin/berks' do
  to node[:olyn_init][:berkshelf][:path]
end
