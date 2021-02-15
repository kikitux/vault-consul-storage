#!/usr/bin/env bash

# create the directory to store vault config files
mkdir -p /etc/vault.d

cat  >/etc/vault.d/config.hcl <<EOF
storage "consul" { 
  address = "127.0.0.1:8500" 
  path    = "vault" 
} 

listener "tcp" { 
  address     = "127.0.0.1:8200" 
  tls_disable = "true" 
}
 
disable_mlock= "true" 
api_addr = "http://127.0.0.1:8200" 
cluster_addr = "https://127.0.0.1:8201" 
ui = "true"
EOF
