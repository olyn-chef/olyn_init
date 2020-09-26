#!/usr/bin/env bash

# Install Berkshelf gem

echo ""
echo "~~~~~~~~~~~~~~~~~~~"
echo "Checking for Berkshelf..."
echo "~~~~~~~~~~~~~~~~~~~"

# Define the path to the Berkshelf gem
berkshelf_path='/opt/chef/embedded/bin/berks'

# Define the path to Chef's gem app
chef_gem_app='/opt/chef/embedded/bin/gem'

# See if Berkshelf exists in the Chef bin
if [ -f $berkshelf_path ]; then

  echo "Berkshelf already installed. Checking version..."

# Otherwise it is not installed
else

  echo "Berkshelf not found..."

  echo "Installing Berkshelf"

  # Run the Chef gem installer
  $chef_gem_app install berkshelf

  echo "Berkshelf install complete!"

fi

berks_installed_version=$(RUBYOPT='-W0' $berkshelf_path -v)

echo "Berkshelf version currently running: $berks_installed_version"
