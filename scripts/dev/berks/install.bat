@ECHO OFF

:: This script calls Berks to install all cookbooks and their dependencies into `[CHEF_ROOT]/cookbooks` from specified sources.
:: Call this script from `[CHEF_ROOT]` during development.
:: A `Berksfile` needs to be present in `[CHEF_ROOT]` with all of the required cookbooks listed.
:: If a `Berksfile.lock` file already exists and the dependency versions are still valid, the existing cookbook version will be used.

:: Run Berks to compile cookbook sources
call berks vendor cookbooks
