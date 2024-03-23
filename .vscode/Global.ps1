[string]$Desktop = [System.Environment]::GetFolderPath('DesktopDirectory')
[string]$WDADesktop = 'C:\Users\WDAGUtilityAccount\Desktop'
#[string]$Win32App = "$env:ProgramData\Win32App"
[string]$Win32App = "C:\TEMP\Win32App"
[string]$Win32Logs = "C:\TEMP\Win32Logs"
[string]$Application = "$(& git branch --show-current)"
#[string]$Cache = "$Env:ProgramData\Win32App\$Application"
[string]$Cache = "C:\TEMP\Win32App\$Application"
[string]$LogonCommand = "LogonCommand.ps1"
[string]$InstallLogs = "C:\ProgramData\Microsoft\IntuneManagementExtension\Logs"

# Cache resources
Remove-Item -Path "$Win32App" -Recurse -Force -ErrorAction Ignore
Remove-Item -Path "$Win32Logs" -Recurse -Force -ErrorAction Ignore
New-Item -Path $Win32Logs -ItemType Directory | Out-Null
Copy-Item -Path "Toolkit" -Destination "$Cache" -Recurse -Force -Verbose -ErrorAction Ignore
explorer "$Cache"