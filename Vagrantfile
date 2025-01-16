# Vagrantfile
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64" # Використання базового образу Ubuntu 20.04

  config.vm.network "private_network", type: "dhcp"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = 2
  end

  config.vm.provision "shell", inline: <<-SHELL
    # Оновлення системи
    sudo apt-get update && sudo apt-get upgrade -y

    # Встановлення Java для Jenkins
    sudo apt-get install openjdk-11-jdk -y

    # Встановлення Jenkins
    wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
    sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
    sudo apt-get update
    sudo apt-get install jenkins -y

    # Запуск та автозапуск Jenkins
    sudo systemctl start jenkins
    sudo systemctl enable jenkins

    # Встановлення Docker
    sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
    sudo apt-get update
    sudo apt-get install docker-ce -y

    # Додавання користувача Jenkins до групи Docker
    sudo usermod -aG docker jenkins

    # Встановлення Docker Compose
    sudo curl -L "https://github.com/docker/compose/releases/download/2.17.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose

    # Перезавантаження системи
    sudo reboot
  SHELL
end
