Vagrant::Config.run do |config|
    ### 64-bit Ubuntu
    config.vm.box = "precise64"

    ### URL to get image if not cached
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"

    ### Network config, based on Vagrant version
    (maj, min, dot) = Vagrant::VERSION.split('.')
    config.vm.network :bridged, "33.33.33.11"
    config.vm.forward_port 6767, 6767
    config.vm.forward_port 8000, 8000

    config.vm.customize do |vm|
        vm.memory_size = 1024
    end

    ### Install and bootstrap Quickness
    config.vm.provision :shell, :inline => "echo -e \"\n### Vagrant \n. /vagrant/etc/profile\" >> /home/vagrant/.profile"
    config.vm.provision :shell, :inline => "/vagrant/bin/quick_new"
end
