@echo off
echo Starting Neural Network Visualizer...
echo.

echo Starting backend server...
start cmd /k "cd backend && python wsgi.py"

echo Starting frontend development server...
start cmd /k "cd frontend && npm start"

echo.
echo Neural Network Visualizer is starting up.
echo Backend: http://localhost:5000
echo Frontend: http://localhost:3000
echo.
echo Press any key to close this window.
pause > nul 