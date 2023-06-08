#Requires -RunAsAdministrator
$run_local=$args[0]
$url_fallback = "https://raw.githubusercontent.com/Alekhoff/chocolatey-fresh-install/master/packages.config"


# install chocolatey if not installed
if (!(Test-Path -Path "$env:ProgramData\Chocolatey")) {
  Invoke-Expression((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

if ($run_local -eq "local") {
# for each package in the list run install
  Get-Content ".\packages.config" | ForEach-Object{($_ -split "\r\n")[0]} | ForEach-Object{choco install -y $_}
}
else
{
# for each package in the list run install
  (Invoke-webrequest -URI $url_fallback).Content | ForEach-Object{($_ -split "\r\n")[0]} | ForEach-Object{choco install -y $_}
}