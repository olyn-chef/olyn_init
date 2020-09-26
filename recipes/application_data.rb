# Setup Chef application data directory
directory node[:olyn_init][:application][:data][:dir] do
  owner 'root'
  group 'root'
  mode 0755
  action :create
end

# Setup lock file directory
directory "#{node[:olyn_init][:application][:data][:dir]}/lock" do
  owner 'root'
  group 'root'
  mode 0755
  action :create
end

# Setup tmp file directory
directory "#{node[:olyn_init][:application][:data][:dir]}/tmp" do
  owner 'root'
  group 'root'
  mode 0755
  action :create
end
