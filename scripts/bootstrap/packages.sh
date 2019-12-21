#!/usr/bin/env bash

# Install required system packages

echo ""
echo "~~~~~~~~~~~~~~~~~~~"
echo "Updating all system packages and installing curl..."
echo "~~~~~~~~~~~~~~~~~~~"

echo "Updating packages..."

# Update all installed system packages
apt-get update

# Specify a lock file to know if this is the first run or not
apt_lock_file="/srv/chef/tmp/scripts.apt.upgrade.lock"

# Perform a package upgrade if this is the first run
if [[ -f ${apt_lock_file} ]]; then

  # Lock file found
  echo "Performing first time package upgrades..."

  # Upgrade all system packages
  apt-get -y upgrade --show-upgraded

else

  # Lock file found
  echo "Skipping package upgrades..."

fi

echo "Installing curl..."

# Install curl
apt-get -y install curl