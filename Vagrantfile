Vagrant.configure("2") do |config|

  config.vm.define "webserver" do |web|
    web.vm.box = "ubuntu/bionic64"
    web.vm.hostname = "webserver"
    web.vm.network "private_network", ip: "192.168.33.10"
    web.vm.network "forwarded_port", guest: 80, host: 8080
    web.vm.provision "shell", path: "setup-web.sh"
  end

  config.vm.define "apiserver" do |api|
    api.vm.box = "ubuntu/bionic64"
    api.vm.hostname = "apiserver"
    api.vm.network "private_network", ip: "192.168.33.11"
    api.vm.network "forwarded_port", guest: 5000, host: 5000
    api.vm.provision "shell", path: "setup-api.sh"
  end

  config.vm.define "dbserver" do |db|
    db.vm.box = "ubuntu/bionic64"
    db.vm.hostname = "dbserver"
    db.vm.network "private_network", ip: "192.168.33.12"
    db.vm.provision "shell", path: "setup-db.sh"
  end

end