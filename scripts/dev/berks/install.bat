@ECHO OFF

:: This script calls Berks to install all cookbooks and their dependencies into `[CHEF_ROOT]/cookbooks` from specified sources.
:: Call this script from `[CHEF_ROOT]` during development.
:: A Berksfile needs to be present in `[CHEF_ROOT]` with all required cookbooks listed.

:: Run Berks to compile cookbook sources
call berks vendor cookbooks