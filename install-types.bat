@echo off
echo Installing THREE.js type definitions...

cd frontend
call npm install --save-dev @types/three

echo Installation complete.
pause 