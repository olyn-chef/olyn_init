#!/usr/bin/env bash

# Install required system packages

echo ""
echo "~~~~~~~~~~~~~~~~~~~"
echo "Updating all system packages and installing curl..."
echo "~~~~~~~~~~~~~~~~~~~"

echo "Updating packages..."

# Update all installed system packages
apt-get update

# Lock file found
echo "Performing package upgrades..."

# Upgrade all system packages - including ones being held back
apt-get upgrade --show-upgraded --with-new-pkgs

# Clean up unneeded packages
apt autoremove

echo "Installing curl..."

# Install curl
apt-get -y install curl
