#downloading package for IBM HTTP SERVER

function IBM_http_server($imcl_path, $package, $ihs_repository, $install_dir, $shared_repo_dir, $port, $creds_path ){ 

    #encrypting master password
    #$Secure_String_Pwd = ConvertTo-SecureString $master_password_path -AsPlainText -Force
    Write-Verbose "Installing IBM HTTP SERVER(IHSILAN)"
    Set-Location -Path $imcl_path
    cmd.exe /c "imcl install $package -repositories $ihs_repository  -installationDirectory $install_dir -sharedResourcesDirectory $shared_repo_dir -properties user.ihs.httpPort=$port -acceptLicense -showProgress -masterPasswordFile $creds_path\master_password.txt -secureStorageFile $creds_path\secure_storage_file.txt"
  

}

#variables
$path = "C:\Users\Administrator\Documents\test\IBM\IBM_HTTP_SERVER\IHS.properties"
$output = Get-Content $path | ConvertFrom-StringData

$imcl_path=$output.imcl_path
$package=$output.package
$ihs_repository=$output.ihs_repository
$install_dir=$output.install_dir
$shared_repo_dir=$output.shared_repo_dir
$port=$output.port
$creds_path=$output.creds_path
$VerbosePreference="continue"


IBM_http_server $imcl_path $package $ihs_repository $install_dir $shared_repo_dir $port $creds_path


if (Test-Path $ihs_install_dir){
    Write-Verbose "Successfully installed !!"
  }
  else{
    Write-Verbose "Unsuccessfull installment"
}

 