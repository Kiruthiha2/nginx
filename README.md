Nginx Web Server Hosting on AWS EC2 with Docker

This project demonstrates how to host a static website using Nginx in a Docker container on an AWS EC2 Ubuntu instance. The hosted page simply displays a greeting message: “Hello from Kiruthihashree's EC2 Web Server!”

Technologies Used:

AWS EC2 (Ubuntu 24.04)

Docker

Nginx

Bash

Git

Project Structure:

The project contains the following files:

index.html: The static HTML file served by Nginx.

Dockerfile: Docker build file to create a custom Nginx image.

setup_custom_nginx.sh: A shell script to build the Docker image and run the container.

Step-by-Step Instructions:

Launch an EC2 Instance:
Create and launch an Ubuntu EC2 instance. Make sure to allow port 80 in the security group and download the .pem key pair.

SSH into EC2:
Connect to the instance using the following command:
ssh -i "/path/to/ngnix_key_pair.pem" ubuntu@<your-ec2-public-ip>

Install Docker:
On your EC2 terminal, install Docker using the commands below:

sql
Copy
Edit
sudo apt update  
sudo apt install docker.io -y  
sudo usermod -aG docker $USER  
newgrp docker  
Create a Project Directory:
Create a directory and navigate into it:
mkdir ~/nginx-site && cd ~/nginx-site

Create the index.html File:
Paste the following content into a file named index.html:

php-template
Copy
Edit
<!DOCTYPE html>
<html>
<head><title>Welcome</title></head>
<body>
    <h1>Hello from Kiruthihashree's EC2 Web Server!</h1>
</body>
</html>
Create a Dockerfile:
Paste the following into a file named Dockerfile:

pgsql
Copy
Edit
FROM nginx:latest  
COPY index.html /usr/share/nginx/html/index.html  
Create and Run a Shell Script (Optional):
Create a shell script called setup_custom_nginx.sh with the content:

bash
Copy
Edit
#!/bin/bash  
docker build -t kiru-nginx .  
docker run -d -p 80:80 --name kiru-nginx-container kiru-nginx  
Then, make the script executable and run it:

bash
Copy
Edit
chmod +x setup_custom_nginx.sh  
./setup_custom_nginx.sh  
Access the Website:
Open a browser and visit http://<your-ec2-public-ip>.
You should see the message: Hello from Kiruthihashree's EC2 Web Server!

Uploading Files to GitHub:

Initialize Git:

csharp
Copy
Edit
git init  
git remote add origin https://github.com/Kiruthiha2/nginx_web_server_hosting.git  
git add .  
git commit -m "Initial commit with Docker and HTML"  
Push to GitHub using Personal Access Token:
Use a GitHub token instead of a password. You can generate one from https://github.com/settings/tokens and use it when prompted.

Stopping or Cleaning Up Docker:

If needed, stop and remove the container using:

arduino
Copy
Edit
docker stop kiru-nginx-container  
docker rm kiru-nginx-container  
Author:
Created by Kiruthihashree as part of a project to learn and demonstrate deploying web servers using Docker and AWS EC2.


Project ScreenShots:
![image](https://github.com/user-attachments/assets/0aaad209-d775-4175-aade-ad057aa94dff)
