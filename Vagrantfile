Vagrant.configure("2") do |config|
    config.vm.box = "hashicorp/bionic64"
    config.vm.provision "shell", path: "scripts/install-vault-consul.sh"
    config.vm.provision "shell", path: "scripts/make-config-consul.sh"
    config.vm.provision "shell", path: "scripts/make-config-vault.sh"
end
