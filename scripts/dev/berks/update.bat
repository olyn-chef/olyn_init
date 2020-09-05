@ECHO OFF

:: This script calls Berks to update all cookbooks and their dependencies into `[CHEF_ROOT]/cookbooks` from specified sources.
:: Call this script from `[CHEF_ROOT]` during development.
:: A `Berksfile` needs to be present in `[CHEF_ROOT]` with all of the required cookbooks listed.
:: Unlike the `install.bat` script, this will attempt to download the latest acceptable versions of all cookbooks and their dependencies.

:: Run Berks to fetch cookbook sources and dependencies to latest acceptable versions
call berks update

:: Run Berks to compile cookbook sources to the cookbook directory
call berks vendor cookbooks
