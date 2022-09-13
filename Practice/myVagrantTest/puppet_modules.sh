#!/bin/bash
# https://stackoverflow.com/a/43161527

function install_module {
   IFS=':' read module version <<< "$1"
   if (puppet module list | grep $module ) >/dev/null; then
       echo "Module $module is already installed"
   else
        puppet module install --target-dir /etc/puppet/modules -v $version $module
    fi
}


# if which puppet >/dev/null; then
#     echo "Puppet is already installed"
# else
echo "Installing puppet"
wget https://apt.puppetlabs.com/puppet5-release-$(lsb_release -cs).deb
dpkg -i puppet5-release-$(lsb_release -cs).deb
apt-get -qq update
apt-get install -y puppet-agent

mkdir -p /etc/puppet/modules;

for var in "$@" 
do
    install_module "$var"
done
