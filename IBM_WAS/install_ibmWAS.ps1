#downloading package for WAS

function IBM_WAS($imcl_path, $package, $was_repository, $install_dir, $shared_repo_dir, $master_pw, $secure_store){ 

#moving to the imcl path and executing imcl command
    Set-Location -Path $imcl_path
    cmd.exe /c "imcl install $package -repositories  $was_repository -installationDirectory $install_dir -sharedResourcesDirectory $shared_repo_dir -acceptLicense -showProgress -masterPasswordFile $master_pw -secureStorageFile $secure_store"
  

}


#variables
$path = "C:\Users\Administrator\Documents\test\IBM\IBM_WAS\WAS.properties"
$output = Get-Content $path | ConvertFrom-StringData

$imcl_path=$output.imcl_path
$package=$output.package
$was_repository=$output.was_repository
$install_dir=$output.install_dir
$shared_repo_dir=$output.shared_repo_dir
$master_pw=$output.master_pw
$secure_store=$output.secure_store

#function call
IBM_WAS $imcl_path $package $was_repository $install_dir $shared_repo_dir $master_pw $secure_store
