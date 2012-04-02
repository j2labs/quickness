Vagrant::Config.run do |config|
    ### 64-bit Ubuntu
    config.vm.box = "lucid64"

    ### URL to get image if not cached
    config.vm.box_url = "http://files.vagrantup.com/lucid64.box"

    ### Network config
    config.vm.network :bridged, "33.33.33.11"
    #config.vm.forward_port "http", 80, 6767

    ### Install and bootstrap Quickness
    Vagrant::Config.run do |config|
        config.vm.provision :shell, :inline => "echo \". /vagrant/etc/profile\" >> /home/vagrant/.profile"
    end
end
