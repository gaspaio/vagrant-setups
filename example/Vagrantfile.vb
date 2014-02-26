# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  config.vm.hostname = "example.vt"
  
  config.vm.box = "ubuntu-saucy64"
  # config.vm.box_url = "http://domain.com/path/to/above.box"

  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.network :private_network, ip: "192.168.33.10"
  # config.vm.network :public_network

  # config.ssh.forward_agent = true

  # File sharing : default strategy
  config.vm.synced_folder "data/", "/vagrant", type: "nfs"
  # 
  # File sharing : extra folder with NFS
  # config.vm.share_folder "folder-id", "/vagrant_extra", "../data_extra", :nfs => true

  # Provider-specific VM configuration
  #
  config.vm.provider :virtualbox do |vb|
      # Don't boot with headless mode
      # vb.gui = true
  
      # Use VBoxManage to customize the VM. For example to change memory:
      vb.customize ["modifyvm", :id, "--memory", "2024"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
  end

  config.vm.provision "ansible" do |ansible|  
    ansible.playbook = "provisioning/playbook.yml"
     
    # If something goes wrong, you'll want Ansible to be more verbose.
    ansible.verbose = true
  end
end
