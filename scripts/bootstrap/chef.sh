#!/usr/bin/env bash

# Install Chef

echo ""
echo "~~~~~~~~~~~~~~~~~~~"
echo "Checking for Chef..."
echo "~~~~~~~~~~~~~~~~~~~"

# Set the version of Chef to install
chef_required_version="15.5.17"

# See if chef is already installed (don't upgrade it)
if grep -q "/opt/chef/embedded/bin" "/root/.bash_profile"; then

  echo "Chef path already existed. Checking version..."

  chef_installed_version_raw=$(chef-client -v)
  chef_installed_version=${chef_installed_version_raw/Chef: /}

  echo "Chef v.$chef_installed_version currently installed"

# Otherwise it is not installed
else

  echo "Chef not found..."

  chef_installed_version=false

fi

# Install chef if chef is not installed or the installed version doesn't match
if [[ "$chef_installed_version" != "$chef_required_version" ]]; then

  echo "Installing Chef v.$chef_required_version..."

  # Run the chef installer with version pin at the end
  curl -L https://www.opscode.com/chef/install.sh | bash -s -- -v ${chef_required_version}
  echo 'export PATH="/opt/chef/embedded/bin:$PATH"' >> /root/.bash_profile && source /root/.bash_profile

  echo "Chef install complete!"

else

  echo "Chef installed version $chef_installed_version matches required version $chef_required_version"

fi

chef_installed_version_raw=$(chef-client -v)
chef_installed_version=${chef_installed_version_raw/Chef: /}

echo "Chef version currently running: $chef_installed_version"