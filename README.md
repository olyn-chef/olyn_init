# Local Dev Setup

## Generated Files

#### Chef Secret Key File
Before deploying to a new environment a secret key file must be generated and saved at `[CHEF_ROOT]/tmp/chef_configs/encrypted_data_bag_secret`.

To generate a new secret key file run the following in a Linux server:

    openssl rand -base64 4096 | tr -d '\r\n' > encrypted_data_bag_secret

## Local Windows Dev Scripts

#### Berks Install Script
This script calls Berks to install all cookbooks and their dependencies into `[CHEF_ROOT]/cookbooks` from specified sources.
Call this script from `[CHEF_ROOT]` during development.
A `Berksfile` needs to be present in `[CHEF_ROOT]` with all of the required cookbooks listed.
If a `Berksfile.lock` file already exists and the dependency versions are still valid, the existing cookbook version will be used.

To execute this script run the following in a Windows Terminal at `[CHEF_ROOT]`:

    .\.source\olyn_init\scripts\dev\berks\install.bat

#### Berks Update Cookbooks Script
This script calls Berks to update all cookbooks and their dependencies into `[CHEF_ROOT]/cookbooks` from specified sources.
Call this script from `[CHEF_ROOT]` during development.
A `Berksfile` needs to be present in `[CHEF_ROOT]` with all of the required cookbooks listed.
Unlike the `install.bat` script, this will attempt to download the latest acceptable versions of all cookbooks and their dependencies.

To execute this script run the following in a Windows Terminal at `[CHEF_ROOT]`:

    .\.source\olyn_init\scripts\dev\berks\update.bat

#### Data Bags Encryption Script
This script encrypts any raw data bags stored under `[CHEF_ROOT]/.unencrypted`.
Call it during development only.
Unencrypted databag contents should never hit a live server or a final git repo.
Encrypted databags are saved to `[CHEF_ROOT]/data_bags`  using the secret key installed to Chef.

To encrypt all data bags run the following in a Windows Terminal at `[CHEF_ROOT]`:

    .\.source\olyn_init\scripts\dev\encrypt\data_bag.bat

To encrypt only specific data bags run the following in a Windows Terminal at `[CHEF_ROOT]`:

    .\.source\olyn_init\scripts\dev\encrypt\data_bag.bat [folder_1] [folder_2]

## Initial Server Setup

#### Create The Chef Root Folder
As root, create the folder where Chef will reside:

    mkdir /srv/chef

#### Upload Chef Files
Connect via SFTP and upload the root of Chef into `/srv/chef`.

#### Run the Bootstrap script
From the server execute the bootstrap script.
It will update and install all required system packages, install Chef itself, and copy the secret key file into place:

    sudo chmod +x /srv/chef/cookbooks/olyn_init/scripts/bootstrap/boot.sh && sudo bash /srv/chef/cookbooks/olyn_init/scripts/bootstrap/boot.sh && sudo chef-solo -c /srv/chef/solo.rb -o "olyn_init"

You can now run any of the standard Chef commands below.

# Chef Commands

#### Standard Chef Run
Runs the default runlist of Chef recipes as specified in the `[CHEF_ROOT]/node.json` file.

    sudo chef-solo -c /srv/chef/solo.rb

#### Run A Single Chef Recipe
Overrides the default run list to run a single specified recipe.

    sudo chef-solo -c /srv/chef/solo.rb -o "[RECIPE_NAME]"

