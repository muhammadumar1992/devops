#!/bin/bash

echo "Updating the apt package index"
sudo apt-get update

echo "Installing packages to allow apt to use a repository over HTTPS"
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

echo "Adding Docker’s official GPG key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "Setting up the stable repository"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Updating the apt package index again"
sudo apt-get update

echo "Installing the latest version of Docker Engine and containerd"
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

echo "Adding current user to the docker group"
sudo usermod -aG docker $USER

echo "Enabling Docker service"
sudo systemctl enable docker

echo "Starting Docker service"
sudo systemctl start docker

echo "Verifying Docker installation"

# Wait for a few seconds to ensure the Docker service is fully started
sleep 5

if ! sudo systemctl is-active --quiet docker; then
    echo "Docker service failed to start. Please check the service status."
    sudo systemctl status docker
    exit 1
fi

if ! docker info &> /dev/null; then
    echo "Cannot connect to the Docker daemon. Please ensure the Docker daemon is running."
    exit 1
fi

echo "Docker version"
docker version

echo "Docker install on locally."

