# Chef configuration directory path
default[:olyn_init][:chef][:config][:dir] = '/etc/chef'

# Olyn application data path
default[:olyn_init][:application][:data][:dir] = Chef::Config[:olyn_application_data_path]

# Location to store the secret key file
default[:olyn_init][:secret_key_file][:path] = "#{node[:olyn_init][:chef][:config][:dir]}/encrypted_data_bag_secret"

# Secret key file data bag item
default[:olyn_init][:secret_key_file][:data_bag_item] = 'secret_key_file'

# Location of Berskhelf
default[:olyn_init][:berkshelf][:path] = '/opt/chef/embedded/bin/berks'
