# Vagrant
This repo holds Vagrant script to create and provision a number of VMs based on Ubuntu 20.04

## prerequisite
   - Install VirtualBox: `$ VBoxManage --version  # 6.1.16_Ubuntur140961`
   - Install Guest Additions for VirtualBox: 
      - `$ sudo apt-get install virtualbox-guest-additions-iso`
      - `$ sudo apt-get update` 
      - `$ sudo apt-get dist-upgrade`
      - `$ sudo apt-get install virtualbox-guest-x11`
      - Check the version: `$ dpkg -l | grep virtualbox-guest`

   - Install Vagrant: `$ sudo apt install vagrant`

## Create the VMs using Vagrant
   - Update `NODE_COUNT` in the file `./Ubuntu_20_04/Vagrantfile` to specify the number of nodes to be created (in addition to a master node).
   - Update the provision script `./Ubuntu_20_04/bootstrap.sh`, if need to install custom packges in each nodes.
   - Change into the directory of `Vagrantfile` file.
   - Run: `~/vagrant/Ubuntu_20_04$ vagrant up`, depending on the network download speed, this step may take long (for first time) to download the base image.
   - SSH nodes: `~/vagrant/Ubuntu_20_04$ vagrant ssh (master|node1|node2)`
   - You could also SSH the nodes from your host machine using: `~/vagrant/Ubuntu_20_04$ ssh vagrant@192.168.33.10  # master node`, using the deafult username/password `vagrant/vagrant`.
   - To bring the VMs down, run: `~/vagrant/Ubuntu_20_04$ vagrant destroy -f`
