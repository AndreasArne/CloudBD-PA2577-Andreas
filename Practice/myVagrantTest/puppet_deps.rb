
def install_dep(name, version)
    install_dir ||= '/etc/puppet/modules'
    "mkdir -p && (puppet module list | grep #{name}) || puppet module install --target-dir /etc/puppet/modules -v #{version} #{name}"
end