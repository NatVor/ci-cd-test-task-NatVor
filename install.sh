#!/bin/bash

# Update the system
echo "Updating the system..."
sudo apt-get update && sudo apt-get upgrade -y

# Install Java (OpenJDK 17) for Jenkins
echo "Installing OpenJDK 17 for Jenkins..."
sudo apt-get install openjdk-17-jdk -y

# Install Jenkins
echo "Installing Jenkins..."
# Add Jenkins repository key
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /etc/apt/trusted.gpg.d/jenkins.asc
# Add Jenkins repository
echo "deb http://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list
# Update package list and install Jenkins
sudo apt-get update
sudo apt-get install jenkins -y

# Start and enable Jenkins service
echo "Starting and enabling Jenkins service..."
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Install Docker
echo "Installing Docker..."
# Install necessary dependencies for Docker
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Add Docker repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
# Update package list and install Docker
sudo apt-get update
sudo apt-get install docker-ce -y

# Add Jenkins user to the Docker group
echo "Adding Jenkins user to the Docker group..."
sudo usermod -aG docker jenkins

# Install Docker Compose
echo "Installing Docker Compose..."
# Download Docker Compose binary
sudo curl -L "https://github.com/docker/compose/releases/download/2.17.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# Make Docker Compose executable
sudo chmod +x /usr/local/bin/docker-compose

# Install Prometheus
echo "Installing Prometheus..."
PROMETHEUS_VERSION="2.46.0"
# Download Prometheus tarball
wget https://github.com/prometheus/prometheus/releases/download/v$PROMETHEUS_VERSION/prometheus-$PROMETHEUS_VERSION.linux-amd64.tar.gz
# Check if Prometheus tarball is downloaded
if [ -f "prometheus-$PROMETHEUS_VERSION.linux-amd64.tar.gz" ]; then
    # Extract Prometheus tarball
    tar xvf prometheus-$PROMETHEUS_VERSION.linux-amd64.tar.gz
    # Move Prometheus files to /usr/local/prometheus
    sudo mv prometheus-$PROMETHEUS_VERSION.linux-amd64 /usr/local/prometheus
    # Create symbolic links for easy access
    sudo ln -s /usr/local/prometheus/prometheus /usr/local/bin/prometheus
    sudo ln -s /usr/local/prometheus/promtool /usr/local/bin/promtool
else
    # Error message if Prometheus download fails
    echo "Error downloading Prometheus."
    exit 1
fi

# Create Prometheus service
echo "Creating Prometheus service..."
# Create a systemd service file for Prometheus
sudo tee /etc/systemd/system/prometheus.service > /dev/null <<EOF
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
ExecStart=/usr/local/bin/prometheus --config.file=/usr/local/prometheus/prometheus.yml --storage.tsdb.path=/usr/local/prometheus/data

[Install]
WantedBy=multi-user.target
EOF

# Create Prometheus user and group
# This will prevent Prometheus from running as root
sudo useradd --no-create-home --shell /bin/false prometheus
# Change ownership of Prometheus files to the prometheus user
sudo chown prometheus:prometheus /usr/local/prometheus /usr/local/prometheus/data

# Start and enable Prometheus service
sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl enable prometheus

# Install Grafana
echo "Installing Grafana..."
# Install necessary dependencies for Grafana
sudo apt-get install -y apt-transport-https software-properties-common wget
# Add Grafana GPG key
sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null
# Add Grafana repository
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list

# Update package list and install Grafana
sudo apt-get update
sudo apt-get install grafana

# Start and enable Grafana service
echo "Starting and enabling Grafana service..."
sudo systemctl start grafana-server
sudo systemctl enable grafana-server

# Display installed versions of the software
echo "Displaying installed software versions..."
echo "Java version:"
java -version
echo "Jenkins version:"
sudo systemctl status jenkins | grep Active
echo "Docker version:"
docker --version
echo "Docker Compose version:"
docker-compose --version
echo "Prometheus version:"
prometheus --version
echo "Grafana version:"
grafana-server -v

# Final message
echo "Installation completed successfully!"

# Reboot the system
echo "Rebooting the system..."
sudo reboot
