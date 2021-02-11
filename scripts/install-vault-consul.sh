#!/usr/bin/env bash

# download vault if not installed
# put it on /usr/local/bin
# updated


which vault
if [ $? -ne 0 ]
then

    # check if unzip is installed
    # install unzip

    which unzip
    if [ $? -ne 0 ]
    then
        # unzip is not on path
        apt-get update
        apt-get install --yes unzip
    fi  

    # download vault.zip into /vagrant
    cd /vagrant
    echo vault_*.zip
    if [ $? -ne 0 ]
    then
    wget https://releases.hashicorp.com/vault/1.6.1/vault_1.6.1_linux_amd64.zip
    fi

    # unzip vault into /usr/local/bin
    # add permissions to be executable
    unzip vault_1.6.1_linux_amd64.zip
    mv vault /usr/local/bin
    chmod +x /usr/local/bin/vault

    # add the HashiCorn GPG key
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

    # add the oficial HashiCorp Linus repository
    sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

    # install jq for json parsing
    sudo apt-get install jq

    # udpate and install Consul
    sudo apt-get update && sudo apt-get install consul

    # move Consul into /usr/local/bin
    # give permissions to be executable
    # mv consul /usr/local/bin
    # chmod +x /usr/local/bin/consul 

fi
