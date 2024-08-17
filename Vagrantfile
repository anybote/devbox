Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-22.04"

  # bootstrap
  config.vm.provision "shell", path: "./bootstrap/motd.sh"
  config.vm.provision "shell", path: "./bootstrap/init.sh"
  config.vm.provision "shell", path: "./bootstrap/apps.sh", privileged: false
end



