# create a new run stage to ensure certain modules are included first
stage { 'pre':
  before => Stage['main']
}

# add the baseconfig module to the new 'pre' run stage
class { 'baseconfig':
  stage => 'pre'
}

# set defaults for file ownership/permissions
File {
  owner => 'root',
  group => 'root',
  mode  => '0644',
}

# all boxes get the base config
include baseconfig



node 'web.box' {
  include nodejs
  class{'nginx': } # https://forge.puppet.com/modules/puppet/nginx/2.1.1/readme
}

node 'dbserver.box' {
  class { '::mysql::server': # https://forge.puppet.com/modules/puppetlabs/mysql/10.10.0/readme
    root_password           => 'strongpassword',
    remove_default_accounts => true,
    restart                 => true,
    # override_options        => $override_options
  }
}

node 'appserver.box' {
  include nodejs
}

node /^tst\d.box$/ {
}

# node default {
#   class { 'install': }
# }
