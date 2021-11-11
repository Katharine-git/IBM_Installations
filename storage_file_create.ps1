# #####################################################################################################
# instructiions : This script allows you to avoid the need of manually entering your IBMid and Password
# for every download or installation of IBM packages.Hence has to be run before installation to create 
# the Secure storage file
# ##################################################################################################### 

function creds($imcl_path, $was_repository, $username, $password, $creds_path){
#Creating creds directory
    New-Item $creds_path -itemtype "directory"
    Write-Verbose "Created new directory $creds_path"

#creating master_password.txt and secure_storage_file.txt
    New-Item -Path $creds_path -Name "master_password.txt" -ItemType "file" 
    Write-Verbose "master_password.txt Created in $creds_path"
    New-Item -Path $creds_path -Name "secure_storage_file.txt" -ItemType "file"
    Write-Verbose "secure_storage_file.txt Created in $creds_path"

#writing to the master_password file
    Add-Content -Path "$creds_path/master_password.txt" -Value $password

#moving to the imcl path and executing imcl command
    Set-Location -Path $imcl_path
    cmd.exe /c "imutilsc saveCredential -url $was_repository -userName $username -userPassword $password -secureStorageFile $creds_path\secure_storage_file.txt -masterPasswordFile $creds_path\master_password.txt"

}

#variables
$path = "C:\Users\Administrator\Documents\test\IBM\IBM_WAS\WAS.properties"
$output = Get-Content $path | ConvertFrom-StringData

$imcl_path=$output.imcl_path
$was_repository=$output.was_repository
$username=$output.username
$password=$output.password
$creds_path=$output.creds_path
$VerbosePreference="continue"

#function call
creds $imcl_path $was_repository $username $password $creds_path
