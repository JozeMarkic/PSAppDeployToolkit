$DesktopPath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop)
# $DesktopPath = Join-Path -Path $HOME -ChildPath Desktop

# $DesktopPath = [Environment]::GetFolderPath("Desktop")
# $DesktopPathAllUsers = [Environment]::GetFolderPath("CommonDesktopDirectory")

Start-Process -FilePath $DesktopPath\DevOps\Deploy-Application.exe