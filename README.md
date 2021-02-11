## This Repository builds with Vagrant a Vault with Consul Storage

### Prerequisites

1. Install the latest version of [Vagrant](https://www.vagrantup.com/docs/installation)

2. Install [VirtualBox](https://www.virtualbox.org/)

### What's included

- [X] A Vagrantfile: [Vagrantfile](https://github.com/dlavric/vault-consul-storage/blob/main/Vagrantfile)
- [X] A script that installs Vault and Consul: [Install Script](https://github.com/dlavric/vault-consul-storage/blob/main/install-vault-consul.sh)
- [X] A script that creates the configuration file for Vault: [Config Vault](https://github.com/dlavric/vault-consul-storage/blob/main/make-config-vault.sh)
- [X] A script that creates the configuration file for Consul [Config Consul](https://github.com/dlavric/vault-consul-storage/blob/main/make-config-consul.sh)

### Instructions to use the repository

- Clone the Repository

```shell
$ git clone git@github.com:dlavric/vault-consul-storage.git
```

- Go to the directory where the repository is located 
```shell
$ cd vault-consul-storage.git
```
- Start Vagrant
```shell
$ vagrant up
```

- Once Vagrant is built, access the Vagrant machine
```shell
$ vagrant ssh
```

- Go to the /vagrant directory
```shell
$ cd /vagrant
```

- Change consul's file user and group ownership
```shell
$ sudo chown -R consul:consul consul
```

- Start Consul
```shell
$ sudo systemctl start consul
```

- Check the status of Consul
```shell
$ sudo systemctl status consul
```

Output:
```
● consul.service - "HashiCorp Consul - A service mesh solution"
   Loaded: loaded (/usr/lib/systemd/system/consul.service; disabled; vendor preset: enabled)
   Active: active (running) since Thu 2021-02-11 14:25:13 UTC; 39s ago
     Docs: https://www.consul.io/
 Main PID: 15215 (consul)
    Tasks: 7 (limit: 1109)
   CGroup: /system.slice/consul.service
           └─15215 /usr/bin/consul agent -config-dir=/etc/consul.d/
```

- Start Vault
```shell
$ vault server -config=./scripts/vault-config/config.hcl
```

Output:
```
==> Vault server configuration:

             Api Address: http://127.0.0.1:8200
                     Cgo: disabled
         Cluster Address: https://127.0.0.1:8201
              Go Version: go1.15.4
              Listener 1: tcp (addr: "127.0.0.1:8200", cluster address: "127.0.0.1:8201", max_request_duration: "1m30s", max_request_size: "33554432", tls: "disabled")
               Log Level: info
                   Mlock: supported: true, enabled: false
           Recovery Mode: false
                 Storage: consul (HA available)
                 Version: Vault v1.6.1
             Version Sha: 6d2db3f033e02e70202bef9ec896360062b88b03

==> Vault server started! Log data will stream in below:

2021-02-11T14:27:38.107Z [INFO]  proxy environment: http_proxy= https_proxy= no_proxy=
2021-02-11T14:27:38.107Z [WARN]  storage.consul: appending trailing forward slash to path
```

- Open a new terminal and destroy the vagrant machine
```shell
vagrant destroy
```
