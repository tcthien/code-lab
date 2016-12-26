Vagrant.configure(2) do |config|
  config.vm.box = "tcthien/java-dev-server"

  config.vm.provider "virtualbox" do |vb|
     vb.memory = "4096"
     vb.name = "codelab-server"
  end
  config.vm.provision "shell", path: "provision.sh", privileged: false
end
