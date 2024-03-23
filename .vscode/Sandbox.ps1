# Vars
. ".vscode\Global.ps1"

# Copy resources
Copy-Item -Path ".vscode\$LogonCommand" -Destination "$win32App\" -Recurse -Force -Verbose -ErrorAction Ignore

# Prepare Sandbox
@"
<Configuration>
<Networking>Enbled</Networking>
<MappedFolders>
    <MappedFolder>
    <HostFolder>$Win32App</HostFolder>
    <SandboxFolder>$WDADesktop</SandboxFolder>
    <ReadOnly>true</ReadOnly>
    </MappedFolder>
    <MappedFolder>
    <HostFolder>$Win32Logs</HostFolder>
    <SandboxFolder>$InstallLogs</SandboxFolder>
    <ReadOnly>false</ReadOnly>
    </MappedFolder>

</MappedFolders>
<LogonCommand>
    <Command>powershell -executionpolicy unrestricted -file "$WDADesktop\LogonCommand.ps1"</Command>
</LogonCommand>
</Configuration>
"@ | Out-File "$Win32App\$Application.wsb"

# Execute Sandbox
if (-not (Get-Process -Name WindowsSandboxClient -ErrorAction SilentlyContinue)) {
    Start-Process explorer -ArgumentList "$Win32App\$Application.wsb" -Verbose -WindowStyle Maximized
} else {
    Write-Warning -Message "Only one Windows Sandbox can run at once!"
}
