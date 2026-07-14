#!/bin/bash

# Samagama Deployment Script

echo "Starting Samagama deployment..."

# Build frontend
echo "Building frontend..."
cd client
npm run build
cd ..

# Start services
echo "Starting services with Docker Compose..."
docker-compose up -d

echo "Deployment complete!"
echo "Frontend: http://localhost:5173"
echo "Backend: http://localhost:5000"
