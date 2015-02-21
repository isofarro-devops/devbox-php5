baseBox    = 'ubuntu/trusty64'
ipAddress  = '192.168.128.128'
projectDir = 'devbox-php5'


Vagrant.configure('2') do |config|
    config.vm.box     = baseBox
    config.vm.network :private_network, ip: ipAddress

    config.vm.provider 'virtualbox' do |my_vm|
        my_vm.customize [
            'modifyvm', :id,
            '--memory', "512"
        ]

        # Fix for slow external network connections
        my_vm.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
        my_vm.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
    end

    config.vm.synced_folder '../', '/home/vagrant/Projects', :nfs => true

    config.vm.provision :puppet do |puppet|
        #puppet.options = '-vd'  # Verbose and Debug
        puppet.options = '-v'  # Verbose

        puppet.manifests_path = 'puppet'
        puppet.manifest_file  = 'base.pp'
        puppet.module_path    = 'puppet/modules'
    end

end
