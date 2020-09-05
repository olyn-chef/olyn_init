@ECHO OFF

:: This script encrypts raw data bags under `[CHEF_ROOT]/.unencrypted`.
:: Call it during development only.
:: Unencrypted databag contents should never hit a live server or a final git repo.
:: Encrypted databags are saved to `[CHEF_ROOT]/data_bags`  using the secret key installed to chef.
:: If no specific data bags are named all data bags found will be encrypted

:: Get all data bags to encrypt (passed as arguments)
set data_bags=(%*)

:: Determine if we are encrypting all data bags or only ones passed in as arguments
if [%1] == [] (
    goto :all_data_bags
  ) else (
    goto :specific_data_bags
  )

:: Loop through each folder in the unencrypted folder
:all_data_bags
    echo No specific data bags specified
    echo Encrypting all data bag directories...
    :: Begin looping through each folder
    for /f "usebackq tokens=*" %%a in (`dir /b/s/a:d .\.unencrypted\data_bags`) do call :encrypt_data_bag %%~nxa
    goto :end_program

:: Loop through each data bag passed as an argument
:specific_data_bags
    echo Specific data bags specified
    echo Encrypting only specified data bag directories...
    for %%i in %data_bags% do call :encrypt_data_bag %%i
    goto :end_program

:: Loop through each data bag item in the unencrypted folder
:encrypt_data_bag
    set data_bag=%1
    echo Encrypting data bag : %data_bag%
    :: Begin looping through each data bag item
    for %%f in (.\.unencrypted\data_bags\%data_bag%\*.json) do call :encrypt_item %data_bag% %%f
    goto :end_loop

:: Encrypts individual data bag items
:encrypt_item
    set folder=%1
    set file=%2
    :: Use knife to encrypt the data bag item
    echo Encrypting data bag item: %file%
    call knife data bag from file %folder% %file% -z --encrypt
    goto :EOF

:: Ends the data bag loop
:end_loop
    echo Done with data bag!
    goto :EOF

:: Ends the program
:end_program
    echo Done with all data bags!

:: Application end
:exit
    @pause
