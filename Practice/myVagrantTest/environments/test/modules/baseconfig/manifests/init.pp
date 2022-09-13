#
# Performs initial configuration tasks for all Vagrant boxes.
#
class baseconfig {
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update';
  }

  # host {
  #   'hostmachine':
  #     ip => '192.168.0.1';

  #   'web':
  #     ip => '192.168.0.42';

  #   'db':
  #     ip => '192.168.0.43';
  # }
}
