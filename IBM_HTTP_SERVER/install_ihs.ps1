#downloading package for IBM HTTP SERVER

function IBM_http_server($imcl_path, $master_password_path, $secureStorageFile ){ 

    #encrypting master password
    #$Secure_String_Pwd = ConvertTo-SecureString $master_password_path -AsPlainText -Force

    Set-Location -Path $imcl_path
    cmd.exe /c "imcl install com.ibm.websphere.liberty.v85_8.5.16003.20160831_1733 -repositories  http://www.ibm.com/software/repositorymanager/com.ibm.websphere.IHS.v85 -installationDirectory IBM/HTTPServer85 -sharedResourcesDirectory /IBM/UserData/InstallationManager/IMShared -properties user.ihs.httpPort=80 -acceptLicense -showProgress -masterPasswordFile $master_password_path -secureStorageFile $secureStorageFile"
  

}

#variables
$path = "C:\Users\Administrator\Documents\IBM\IBM_HTTP_SERVER\IHS.properties"
$output = Get-Content $path | ConvertFrom-StringData

$imcl_path=$output.imcl_path
$master_password_path=$output.master_password_path
$secureStorageFile=$output.secureStorageFile
#$Secure_String_Pwd=$output.Secure_String_Pwd

IBM_http_server $imcl_path

 