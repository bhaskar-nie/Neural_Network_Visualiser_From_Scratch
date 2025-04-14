Write-Host "Starting Neural Network Visualizer..." -ForegroundColor Green
Write-Host ""

# Start the backend server
Write-Host "Starting backend server..." -ForegroundColor Cyan
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot\backend'; python wsgi.py"

# Wait a moment for backend to initialize
Start-Sleep -Seconds 2

# Start the frontend development server
Write-Host "Starting frontend development server..." -ForegroundColor Cyan
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot\frontend'; npm start"

Write-Host ""
Write-Host "Neural Network Visualizer is starting up." -ForegroundColor Green
Write-Host "Backend: http://localhost:5000" -ForegroundColor Yellow
Write-Host "Frontend: http://localhost:3000" -ForegroundColor Yellow
Write-Host ""
Write-Host "Press any key to close this window..."
$host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | Out-Null 