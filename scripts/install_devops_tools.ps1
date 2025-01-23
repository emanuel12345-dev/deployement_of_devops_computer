# scripts/install_devops_tools.ps1
# Enable TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Write-Host "Starting installation..."

# Install Chocolatey
Write-Host "Installing Chocolatey..."
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Refresh environment variables to make choco available
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Host "Installing WSL2..."
# Install WSL2
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Download and install WSL2 kernel update
Write-Host "Downloading WSL2 kernel update..."
$wslUrl = "https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi"
$wslInstaller = "$env:TEMP\wsl_update_x64.msi"
Invoke-WebRequest -Uri $wslUrl -OutFile $wslInstaller
Start-Process msiexec.exe -Wait -ArgumentList "/I $wslInstaller /quiet"

# Set WSL2 as default
Write-Host "Setting WSL2 as default..."
wsl --set-default-version 2

# Install tools using Chocolatey
Write-Host "Installing DevOps tools..."
choco install -y --no-progress `
    docker-desktop `
    git `
    vscode `
    python3 `
    terraform `
    kubernetes-cli `
    kubernetes-helm

# Create startup script for Docker Desktop
Write-Host "Creating Docker Desktop startup script..."
$startupScript = @"
Start-Sleep -Seconds 30
Start-Process "C:\Program Files\Docker\Docker\Docker Desktop.exe"
"@
$startupScript | Out-File -FilePath "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\StartDocker.ps1"

Write-Host "Installation complete!"