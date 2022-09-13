class nodejs (
) {
  package { "curl":
    ensure  => latest
  }
  exec {"prepare nodejs":
    command => 'curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -',
    provider => shell,
    onlyif => "/bin/bash -c 'command -v curl'"
  }

    package { "nodejs":
      ensure => "latest"
    }
    package { "git":
      ensure => "latest"
    }
    package { "build-essential":
      ensure => "latest"
    }
}
