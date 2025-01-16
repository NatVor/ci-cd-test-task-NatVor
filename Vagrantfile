Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = 1 
  end  

  # Port forwarding for SSH
  config.vm.network "forwarded_port", guest: 22, host: 2222

  # Port forwarding for Jenkins
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  # Port forwarding for app
  config.vm.network "forwarded_port", guest: 5000, host: 5000

  # Port forwarding for Prometheus
  config.vm.network "forwarded_port", guest: 9090, host: 9090
  
  # Port forwarding for Grafana
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  # Sync folder from host to guest
  config.vm.synced_folder "C:/Users/1/shared_folder", "/home/vagrant/shared_folder"
end
