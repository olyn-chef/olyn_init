# Setup Chef directory permissions
directory node[:olyn_init][:chef_config_dir] do
  owner 'root'
  group 'root'
  mode 0700
end

# Load the secret key file data bag item
secret_key_file = data_bag_item('chef_configs', node[:olyn_init][:secret_key_file_data_bag_item])

# Install the secret key file
remote_file node[:olyn_init][:secret_key_file_path] do
  source "file://#{secret_key_file[:source]}"
  owner 'root'
  group 'root'
  mode 0600
  only_if { File.exist?(secret_key_file[:source]) }
end

# Remove the secret key file original source
file secret_key_file[:source] do
  action :delete
  not_if { secret_key_file[:source].nil? }
  only_if { File.exist?(secret_key_file[:source]) }
end