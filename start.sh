#!/bin/bash

echo "Starting Grafana Alloy Stack..."

# Stop any existing containers
echo "Stopping existing containers..."
docker compose down

# Remove any existing volumes (optional - uncomment if you want fresh data)
# echo "Removing existing volumes..."
# docker compose down -v

# Start services in order
echo "Starting core services..."
docker compose up -d mimir loki

echo "Waiting for core services to be ready..."
sleep 10

echo "Starting Tempo..."
docker compose up -d tempo

echo "Waiting for Tempo to be ready..."
sleep 5

echo "Starting remaining services..."
docker compose up -d

echo "Checking service status..."
docker compose ps

echo "Stack started! Access Grafana at http://localhost:4000"
echo "Default credentials: admin/admin"
