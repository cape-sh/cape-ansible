
### Install CAPE

> There are 2 options for accessing CAPE. Follow one of the options below as "root" user on the machine that you want to deploy to.

Before getting started know:

- Private IP address is used with a local or on premise network and public IP address is used outside the network. 
- Public IP address is provided by ISP, Internet Service Provider.

#### Deployment Steps: 

- Option 1 : 

**TO Access CAPE UI on a local VM using private IP env.**

>   **Eg**: You and your VM are at home and you want to access using a private IP e.g., 192.168.1.7
 
```bash
$ curl https://raw.githubusercontent.com/cape-sh/cape-ansible/master/script/capesaaPvtIP.sh > capesaaPvtIP.sh
$ sh capesaaPvtIP.sh
```

- Option 2:

**TO Access CAPE UI on Remote or Cloud VM with public IP env.**

>   **Eg**: Your VM is in the cloud and has a public IP e.g., 13.103.25.99

```bash
$ curl  https://raw.githubusercontent.com/cape-sh/cape-ansible/master/script/capesaasPubIP.sh > capesaasPubIP.sh
$ sh capesaasPubIP.sh
```
---

### Access CAPE UI 

The service may take 1-5 mins to come up based on the server config and the internet bandwidth.

> URL

```
http://<Your_server_ip>.nip.io/
```
** All CAPE documentation is available [here](https://docs.cape.sh/docs/) **

---

### What do the different Ansible roles do?

```
 1. Prereq: Prerequisite config at the os layer e.g., autoconfigure all repositories , SELinux , disable firewall etc.
 2. Download: Downloads all the relevant packages and scripts
 3. K3S: Installs k3s, crictl master on centos7/RHEL7 
 4. Cape: Installs the CAPE SAAS application & enables access to CAPE GUI via URL
 5. Reset: Uninstalls the Kubernetes packages from your machine 
``` 
---

### Troubleshooting 

Login as root to your machine

```bash
kubectl get pods -n cape
```
Make sure all pods are in a healthy state else kill any unhealthy pods and they will restart within a few seconds

---

### RESET everything using playbook

Login as root to your machine

> Run this playbook to uninstall Kubernetes and crictl

```bash
cd cape-ansible
ansible-playbook reset.yml
```
> "cape-ansible" directory is located where the capesaasPubIP.sh or capesaasPvtIP.sh script was downloaded earlier.

---

### Recommended System requirements

```
OS: Centos 7.3/7.4/7.5  
CPU: 2 core
RAM: 4GB RAM
Disk Space: 10 GB free 
Server Internet access: Yes
```

---

## Support
For more information on CAPE, return to the main [Repo](https://github.com/cape-sh/cape)







