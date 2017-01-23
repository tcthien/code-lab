Vagrant.configure("2") do |config|
    config.vm.box = "tcthien/java-dev-server"


    config.vm.synced_folder "C:/Users/admin/.m2/repository", "/share/mavenRepo"
    config.vm.synced_folder "", "/share/source"

    config.vm.network "private_network", ip: "192.168.100.100"
    config.vm.network "forwarded_port", guest: 3306, host: 3306
    config.vm.network "forwarded_port", guest: 9042, host: 9042
    config.vm.network "forwarded_port", guest: 7000, host: 7000
    config.vm.network "forwarded_port", guest: 7001, host: 7001
    config.vm.network "forwarded_port", guest: 9160, host: 9160

    config.vm.provider "virtualbox" do |vb|
        vb.memory = "4096"
        vb.name = "codelab-server"
    end

    config.vm.provision "shell", inline: <<-SHELL
        #Add PASSWORD TO ENV
        echo 'export CODELAB_USER="codelab"' >> ~/.bashrc
        echo 'export CODELAB_PASS="codelab"' >> ~/.bashrc
        echo 'export CODELAB_USER="codelab"' >> ~/.zshrc
        echo 'export CODELAB_PASS="codelab"' >> ~/.zshrc
    SHELL

end

