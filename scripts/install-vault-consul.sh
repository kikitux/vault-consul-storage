#!/usr/bin/env bash

# install vault if not installed

which vault consul
if [ $? -ne 0 ]
then

    # add the HashiCorn GPG key
    curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -

    # add the oficial HashiCorp Linus repository
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

    # udpate and install Vault and Consul
    sudo apt-get update
    sudo apt-get install -y vault consul

    # install jq for json parsing
    apt-get install -y jq

fi
