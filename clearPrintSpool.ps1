#################################################################
# Parameters
#################################################################
$WinVMName = "Win11VM"
$PolicyScope = "Machine" # Scope used for GPO. Can be set to "Machine" or "User".
$IsoPath = "$env:userprofile\Downloads\Win11_English_x64.iso" # Location where you saved your ISO file.
$vhdPath = "C:\VMs\VHDs\Win11.vhdx" # Locatiion where your VHD will be saved
$currentTimeStamp = (Get-Date -Format "MM-dd-yyyy_hh-mm-ss").ToString()
$logPath = "C:\VMs\VM Logs\VM-Log_" + $currentTimeStamp + ".txt"
$waitTime = 5

#################################################################
# Functions
#################################################################

#################################################################
# Ensure script run as Admin and relaunch if not
#################################################################
$CurrentIdentity = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$CurrentPrincipal = New-Object System.Security.Principal.WindowsPrincipal($CurrentIdentity)
 
if (-not ($CurrentPrincipal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator))) {
    Write-Warning "You do not have Administrator rights to run this script."
    Write-Warning "Launching a new powershell process as Administrator in $WaitTime seconds..." 
    Start-Sleep -Seconds $WaitTime 
    $Arguments = '-File "' + $PSCommandPath + '"' 
    Start-Process "powershell" -Verb RunAs -ArgumentList $Arguments 
    return
}

# This is used for storing info related to the run in case you need it for troubleshooting and such.
Start-Transcript -path $logPath

# Stops the print spooler so stuck print files can be removed
net stop spooler

# Remove the print job files that got stuck
del %systemroot%\System32\spool\printers\* /Q

# Restart the print spooler
net start spooler

Stop-Transcript