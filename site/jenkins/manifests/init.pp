class jenkins {

  #Ensure the latest version of Java is installed since Jenkins requires JRE v1.8+
  package { 'java8':
  
    name   => 'java-1.8.0-openjdk',
    ensure => installed,
  }
  
 package { "jenkins":
  
   provider => rpm,
   source   => "http://pkg.jenkins-ci.org/redhat/jenkins-2.122-1.1.noarch.rpm",
   ensure   => installed,
   #require  => Package['java8'],
}


 file {'/etc/systemd/system/jenkins.service':
 
    ensure  => file,
    source  => 'puppet:///modules/jenkins/jenkins.service',
  }
  
 service{'minecraft':
  
    ensure  => running,
    enable  => true,
    require => [ Package['java8'] , File['/etc/systemd/system/jenkins.service'] ],
  }
  
}
