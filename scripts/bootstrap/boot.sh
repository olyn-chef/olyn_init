#!/usr/bin/env bash

# This is the main Chef server side script.
# It will install all required system packages, setup the databag secret key file, and then install Chef itself.
# The secret key file to install is located at `./.chef/scripts/server/encrypted_data_bag_secret`.
# That file should never be stored unencrypted in a git repo.

# Get the current directory of this script
DIR="${BASH_SOURCE%/*}"

# Determine the correct path
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

# Call each sub script individually
. "$DIR/packages.sh"
. "$DIR/chef.sh"