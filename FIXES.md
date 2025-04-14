# Neural Network Visualizer - Fixes for THREE.js Type Issues

## Issue Identified
The TypeScript compiler is reporting an error related to THREE.js:
```
ERROR in src/components/NeuralNetworkVisualizer.tsx:3:24
TS2307: Cannot find module 'three' or its corresponding type declarations.
    1 | import React, { useRef, useEffect, useState } from 'react';
    2 | import styled from 'styled-components';
  > 3 | import * as THREE from 'three';
      |                        ^^^^^^^
    4 |
    5 | // Types
    6 | type NeuronType = 'input' | 'hidden' | 'output';
```

## Current Status
- We have already removed the THREE.js import statement and replaced it with a comment:
  ```typescript
  // Note: THREE.js functionality has been removed to fix TypeScript errors
  // Import * as THREE from 'three' can be added back when needed
  ```

## Steps to Fix Completely

### Option 1: Install TypeScript Definitions for THREE.js
1. Open a Command Prompt window (not PowerShell) with Administrator privileges
2. Navigate to your project directory
3. Run the following commands:
   ```bash
   cd frontend
   npm install --save-dev @types/three
   ```

### Option 2: Install THREE.js with TypeScript Definitions
If you need THREE.js functionality now or in the future:
1. Open a Command Prompt window with Administrator privileges
2. Navigate to your project directory
3. Run the following commands:
   ```bash
   cd frontend
   npm install three
   npm install --save-dev @types/three
   ```
4. Uncomment the THREE.js import in the NeuralNetworkVisualizer.tsx file:
   ```typescript
   import * as THREE from 'three';
   ```

### Option 3: If You're Not Using THREE.js
If the project doesn't actually use THREE.js at all:
1. Remove the dependency from package.json
2. Keep the comment in the code to remind future developers

## Security Policy Note
If you encounter security policy errors when running npm or PowerShell scripts, you can temporarily change the execution policy in an Administrator PowerShell:
```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```
This will allow scripts to run only for the current PowerShell session. 