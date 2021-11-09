#downloading package for WAS

function IBM_WAS($was_path){ 

    Set-Location -Path $was_path
    cmd.exe /c "imcl install com.ibm.websphere.liberty.v85_8.5.16003.20160831_1733 -repositories  http://www.ibm.com/software/repositorymanager/com.ibm.websphere.liberty.ND -installationDirectory -install /IBM/ProdData/WebSphere/AppServer/V85/ND -sharedResourcesDirectory /IBM/UserData/InstallationManager/IMShared -acceptLicense -showProgress -masterPasswordFile C:/Users/Administrator/Documents/creds/master_password.txt -secureStorageFile C:\Users\Administrator\Documents\creds\secure_storage_file.txt"
  

}


#variables
$path = "C:\Users\Administrator\Documents\IBM\IBM_WAS\WAS.properties"
$output = Get-Content $path | ConvertFrom-StringData

$was_path=$output.was_path

IBM_WAS $was_path
