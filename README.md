Olyn development utilities and init cookbook/scripts for Chef.

### Chef Secret Key File Setup
Before deploying to a new environment a secret key file must be saved at `[CHEF_ROOT]/tmp/chef_configs/encrypted_data_bag_secret`

Command to generate a secret key:  
`openssl rand -base64 4096 | tr -d '\r\n' > encrypted_data_bag_secret`

### Local Windows Development Scripts

#### cookbooks/olyn_init/scripts/dev/berks/install.bat
This script calls Berks to install all cookbooks and their dependencies into `[CHEF_ROOT]/cookbooks` from specified sources.
Call this script from `[CHEF_ROOT]` during development.
A Berksfile needs to be present in `[CHEF_ROOT]` with all of the required cookbooks listed.

Called with:  
`.\.source\olyn_init\scripts\dev\berks\install.bat`

#### cookbooks/olyn_init/scripts/dev/encrypt/data_bag.bat
This script encrypts any raw data bags stored under `[CHEF_ROOT]/.unencrypted`.
Call it during development only.
Unencrypted databag contents should never hit a live server or a final git repo.
Encrypted databags are saved to `[CHEF_ROOT]/data_bags`  using the secret key installed to Chef.

Encrypt all data bags:  
`.\.source\olyn_init\scripts\dev\encrypt\data_bag.bat`

Encrypt specific data bags:  
`.\source\olyn_init\scripts\dev\encrypt\data_bag.bat [folder_1] [folder_2] [folder_3]`

### Server Side Scripts

#### cookbooks/olyn_init/scripts/bootstrap/boot.sh

This is the main Chef server side script for installation.
It will install all required system packages and then install Chef itself.

Called with:  
`./cookbooks/olyn_init/scripts/bootstrap/boot.sh`

