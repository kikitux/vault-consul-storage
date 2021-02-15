#!/usr/bin/env bash

mkdir -p /etc/consul.d

mkdir -p /var/consul/data
chown -R consul:consul /var/consul/data

# populate the config file consul.hcl 
cat > /etc/consul.d/consul.hcl <<EOF
{
    "server": true,
    "node_name": "consul_s1",
    "datacenter": "dc1",
    "data_dir": "/var/consul/data",
    "bind_addr": "0.0.0.0",
    "client_addr": "0.0.0.0",
    "advertise_addr": "10.1.42.101",
    "bootstrap_expect": 1,
    "retry_join": ["10.1.42.101"],
    "ui": true,
    "log_level": "DEBUG",
    "enable_syslog": true,
    "acl_enforce_version_8": false
}
EOF
