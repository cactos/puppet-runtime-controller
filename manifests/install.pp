
class cactos_runtime_controller::install inherits cactos_runtime_controller{

  # install sed
  package { 'sed':
    ensure => 'installed',
  }

  # install bash
  package { 'bash':
    ensure => 'installed',
  }

  # install git
  package { 'git':
    ensure => 'installed',
  }
  
  # install grep
  package { 'grep':
    ensure => 'installed',
  }
  notify{'runtime-controller':}
  
  # install nodejs with epel
  class { '::nodejs':
    nodejs_dev_package_ensure => 'present',
    npm_package_ensure        => 'present',
    repo_class                => '::epel',
  }
  
  # create rt controller directory
  file { '/opt/rtc/':
    ensure => directory,
  }
  
  # clone repo
  vcsrepo { '/opt/rtc/':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/cactos/Cactos-Runtime.git',
    remote   => 'origin',
    require  => Package['git'],
  }
  
  # check for binary
  file { '/opt/rtc/runtime-controller/bin/config_operator.sh':
    ensure => present,
    mode => 755,
  }

  # install httpdispatcher
  nodejs::npm { 'httpdispatcher':
    ensure  => 'present',
    package => 'httpdispatcher',
    target  => '/opt/rtc/runtime-controller/src',
    require => Vcsrepo['/opt/rtc/'],
  }

  # install shelljs
  nodejs::npm { 'shelljs':
    ensure  => 'present',
    package => 'shelljs',
    target  => '/opt/rtc/runtime-controller/src',
    require => Vcsrepo['/opt/rtc/'],
  }

}

