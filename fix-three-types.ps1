# Set the working directory to the frontend folder
Set-Location -Path frontend

# First, check if there are any imports of THREE in the codebase
Write-Host "Checking for THREE imports in the codebase..." -ForegroundColor Yellow
$threeImports = Get-ChildItem -Path src -Recurse -Filter "*.tsx" | Select-String -Pattern "import.*THREE.*from.*'three'"

if ($threeImports) {
    Write-Host "Found THREE imports in the following files:" -ForegroundColor Red
    $threeImports | ForEach-Object { Write-Host $_.Path }
    
    # Install @types/three
    Write-Host "Installing @types/three package..." -ForegroundColor Yellow
    npm install --save-dev @types/three
    
    Write-Host "THREE types installed successfully!" -ForegroundColor Green
} else {
    Write-Host "No THREE imports found in the codebase." -ForegroundColor Green
    
    # Check if there are any references to THREE in the codebase
    $threeReferences = Get-ChildItem -Path src -Recurse -Filter "*.tsx" | Select-String -Pattern "THREE\."
    
    if ($threeReferences) {
        Write-Host "Found THREE references in the following files:" -ForegroundColor Yellow
        $threeReferences | ForEach-Object { Write-Host $_.Path }
        
        # Install @types/three
        Write-Host "Installing @types/three package..." -ForegroundColor Yellow
        npm install --save-dev @types/three
        
        Write-Host "THREE types installed successfully!" -ForegroundColor Green
    } else {
        Write-Host "No THREE references found in the codebase." -ForegroundColor Green
        
        # Remove any existing THREE references from package.json
        Write-Host "Removing THREE dependencies from package.json..." -ForegroundColor Yellow
        npm uninstall three @types/three
        
        Write-Host "THREE dependencies removed successfully!" -ForegroundColor Green
    }
}

# Return to the root directory
Set-Location -Path .. 