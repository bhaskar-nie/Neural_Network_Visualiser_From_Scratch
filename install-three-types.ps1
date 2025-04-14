# PowerShell script to install THREE.js types
Write-Host "Installing THREE.js type definitions..." -ForegroundColor Yellow

# Navigate to frontend directory
Push-Location -Path "frontend"

try {
    # Install the THREE.js types package
    npm install --save-dev @types/three
    
    # Verify installation
    if ($LASTEXITCODE -eq 0) {
        Write-Host "THREE.js types successfully installed!" -ForegroundColor Green
    } else {
        Write-Host "Failed to install THREE.js types. Please try manually running: npm install --save-dev @types/three" -ForegroundColor Red
    }
} finally {
    # Return to original directory
    Pop-Location
} 