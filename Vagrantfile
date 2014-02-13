# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.define :frankoak do |fo_dev_config|
        fo_dev_config.vm.box = "precise32"
        fo_dev_config.vm.box_url = "http://files.vagrantup.com/precise32.box"
        fo_dev_config.ssh.forward_agent = true
        
        # This will give the machine a static IP uncomment to enable
        # fo_dev_config.vm.network :private_network, ip: "192.168.56.101"
        
        fo_dev_config.vm.network :forwarded_port, guest: 80, host: 8888, auto_correct: true
        fo_dev_config.vm.network :forwarded_port, guest: 3306, host: 8889, auto_correct: true
        fo_dev_config.vm.network :forwarded_port, guest: 5432, host: 5433, auto_correct: true
        fo_dev_config.vm.hostname = "FrankOak-Dev"
        fo_dev_config.vm.synced_folder "/Users/mac/Documents/Development/FrankOak/Frank-Oak-2.0", "/var/www", {:mount_options => ['dmode=777','fmode=777']}
        fo_dev_config.vm.provision :shell, :inline => "echo \"Canada/Eastern\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"

        fo_dev_config.vm.provider :virtualbox do |v|
            v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
            v.customize ["modifyvm", :id, "--memory", "512"]
        end

        fo_dev_config.vm.provision :puppet do |puppet|
            puppet.manifests_path = "puppet/manifests"
            puppet.manifest_file  = "phpbase.pp"
            puppet.module_path = "puppet/modules"
            #puppet.options = "--verbose --debug"
        end

        fo_dev_config.vm.provision :shell, :path => "puppet/scripts/enable_remote_mysql_access.sh"
        fo_dev_config.vm.provision :shell, :path => "puppet/scripts/install_phpredis.sh"
    end
end
