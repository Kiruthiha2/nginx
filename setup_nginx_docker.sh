#!/bin/bash

# Exit on any error
set -e

echo "🔄 Updating system..."
sudo apt update && sudo apt upgrade -y

echo "🐳 Installing Docker..."
sudo apt install docker.io -y

echo "🚀 Starting and enabling Docker service..."
sudo systemctl start docker
sudo systemctl enable docker

echo "👤 Adding user '$USER' to docker group..."
sudo usermod -aG docker $USER

echo "🌐 Pulling and running Nginx container..."
sudo docker run -d --name nginx-server -p 80:80 nginx

echo "✅ Nginx is running in a Docker container!"
echo "👉 Visit your EC2 public IP in a browser to view the Nginx welcome page."
echo "⚠️ Logout and login again to use Docker without sudo."
