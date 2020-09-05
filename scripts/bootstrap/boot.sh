#!/usr/bin/env bash

# This is the main Chef server side script.
# It will install all required system packages and then install Chef itself.

# Get the current directory of this script
DIR="${BASH_SOURCE%/*}"

# Determine the correct path
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

# Call each sub script individually
. "$DIR/packages.sh"
. "$DIR/chef.sh"
