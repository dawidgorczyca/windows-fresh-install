# Fresh Windows install choco script
Script to get up and running on a new system or fresh install with all the apps you use in no time!

Checks if you have chocolatey installed, then install all applications you have listed in the `packages.config` file. 

## Install application list from Github:
Make a fork and change the contents of `packages.config` to whatever apps you want to install, change the `$url_fallback` variable to match your fork.

Open a Powershell instance in admin mode and execute:

```console
$ Set-ExecutionPolicy Bypass -Scope Process -Force
```
Run the following command(change the url to match your github user):
```console
$ Invoke-Expression((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Alekhoff/chocolatey-fresh-install/master/install.ps1'))
```
It downloads the chocolatey script and execute it.

## Install localy
Download zip, change packages to your preference in `packages.config` and run in admin Powershell:
```
$ install.ps1 local
```