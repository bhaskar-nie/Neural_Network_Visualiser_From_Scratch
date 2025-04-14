#!/bin/bash

echo "Starting Neural Network Visualizer..."
echo ""

echo "Starting backend server..."
cd backend && python wsgi.py &
BACKEND_PID=$!

echo "Starting frontend development server..."
cd frontend && npm start &
FRONTEND_PID=$!

echo ""
echo "Neural Network Visualizer is starting up."
echo "Backend: http://localhost:5000"
echo "Frontend: http://localhost:3000"
echo ""
echo "Press Ctrl+C to stop the application."

# Wait for user interrupt (Ctrl+C)
trap "kill $BACKEND_PID $FRONTEND_PID; exit" INT
wait 