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
downloadIM $url $destination 
 
#Extracting the contents of zip file
function installIM ($destination,$unzip_destination){
  Expand-Archive -LiteralPath $destination -DestinationPath $unzip_destination -Force
  if (Test-Path "$unzip_destination\Installation Manager")
  {
    Write-Verbose "Files successfully extracted !"

  }
  else{
    Write-Verbose "Something went wrong..Kindly give correct file format"
  }
}

installIM $destination $unzip_destination

#Running IBM_Installation_manager
cmd.exe /c "installc -acceptLicense"

#variables
$path = "C:\Users\Administrator\Documents\IBM\IM.properties"
$output = Get-Content $path | ConvertFrom-StringData

$url=$output.url
$destination = $output.destination
$unzip_destination = $output.unzip_destination





















