#!/usr/bin/env bash

# This script creates the Olyn application data directories

# Define the root application data directory
application_data_dir='/var/lib/olyn'

# Define required sub directories
application_sub_dirs=( "lock" "tmp" )

echo ""
echo "~~~~~~~~~~~~~~~~~~~"
echo "Checking Olyn application data directories"
echo "~~~~~~~~~~~~~~~~~~~"

# Create the root application data directory if it does not exist
if [ ! -d $application_data_dir ]; then
  echo "$application_data_dir Created"
  mkdir $application_data_dir
else
  echo "$application_data_dir OK"
fi

# Create sub directories
for i in "${application_sub_dirs[@]}"
do

  # Create the sub directory if it does not exist
  if [ ! -d "$application_data_dir/$i" ]; then
    echo "$application_data_dir/$i Created"
    mkdir "$application_data_dir/$i"
  else
    echo "$application_data_dir/$i OK"
  fi

done
