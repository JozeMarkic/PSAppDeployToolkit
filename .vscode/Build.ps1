# Vars
. ".\.vscode\Global.ps1"

# IntuneWin
[string]$Uri = "https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool/raw/master"
[string]$Exe = "IntuneWinAppUtil.exe"

# Source content prep tool
if (-not (Test-Path -Path $env:ProgramData\$Exe)){
    Invoke-WebRequest -Uri "$Uri/$Exe" -OutFile "$env:ProgramData\$Exe"
}

# Execute content prep tool
$ProcessOptions = @{
    FilePath = "$env:ProgramData\$Exe"
    ArgumentList = "-c ""$Cache"" -s ""$Cache\Deploy-Application.exe"" -o ""$env:TEMP"" -q"
    WindowStyle = "Maximized"
    Wait = $True
}
Start-Process @ProcessOptions

# Rename and prepare for upload
Move-Item -Path "$Env:TEMP\Deploy-Application.intunewin" -Destination "$Desktop\$Application.intunewin" -Force -Verbose
explorer $Desktop
