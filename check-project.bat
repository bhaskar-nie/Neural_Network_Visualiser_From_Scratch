@echo off
echo Checking Neural Network Visualizer Project Structure...
echo.

echo === Frontend Package.json Dependencies ===
cd frontend
type package.json | findstr "three"
cd ..

echo.
echo === Checking NeuralNetworkVisualizer.tsx ===
cd frontend\src\components
type NeuralNetworkVisualizer.tsx | findstr /N "THREE"
cd ..\..\..

echo.
echo === Project Structure Check Complete ===
echo.
echo If you see any THREE.js dependencies or references that need to be fixed,
echo please refer to the FIXES.md file for instructions.
echo.

pause 