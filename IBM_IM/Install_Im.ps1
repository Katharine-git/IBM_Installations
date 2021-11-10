#download Zip File
function downloadIM ($url,$destination)
{
  $status = wget $url -UseBasicParsing | ForEach-Object { $_.StatusCode }
  if ($status -eq 200)
  {
    Write-Verbose "URL exist ...downloading started"
  }
  Invoke-WebRequest -Uri $url -OutFile $destination
  if (Test-Path $destination)
  {
    Write-Verbose "ready to extract"

  }
} 
 
 
#Extracting the contents of zip file
function installIM ($destination,$unzip_destination){
  Expand-Archive -LiteralPath $destination -DestinationPath $unzip_destination -Force
  if (Test-Path "$unzip_destination\Installation Manager")
  {
    Write-Verbose "Files successfully extracted !"

  }
  else{
    Write-Verbose "Something went wrong..please give correct file format"
  }
}


#Running IBM_Installation_manager
cmd.exe /c "installc -acceptLicense"

#variables
$path = "C:\Users\Administrator\Documents\test\IBM\IBM_IM\IM.properties"
$output = Get-Content $path | ConvertFrom-StringData

$url=$output.url
$destination = $output.destination
$unzip_destination = $output.unzip_destination
$VerbosePreference="continue"

#function call
downloadIM $url $destination
installIM $destination $unzip_destination





















