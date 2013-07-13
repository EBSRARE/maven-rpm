# Basic Puppet Apache manifest

import "nodes"
import "clean"

class apache {
  exec { 'yum update':
    command => '/usr/bin/yum -y update'
  }
  #yum_update{ 'yum update'
  #}

  package { "httpd":
    ensure => present,
  }

  service { "httpd":
    ensure => running,
    require => Package["httpd"],
  }

  file { '/var/www/html/index.html':
    source => "/vagrant/index.html",
    notify => Service['httpd'],
    force  => true
  }
}

class helloworld {
  exec { 'yum update':
    command => '/usr/bin/yum -y update'
  }
  
  file { '/usr/java':
    ensure => directory
  }
  #yum_update{'yum update'}
  
  file { '/usr/java/latest/':
    ensure => link,
    target => "/usr/lib/jvm/java-1.7.0/",
    force  => true
  }
  
  package { "helloworld":
    ensure => present,
  } 
}