class jenkins {

  #Ensure the latest version of Java is installed since Jenkins requires JRE v1.8+
  package { 'java8':
    name   => 'java-1.8.0-openjdk',
    ensure => installed,
  }
  
 #Install the package jenkins 
 package { "jenkins":  
   #provider => rpm,
   #source   => "http://pkg.jenkins-ci.org/redhat/jenkins-2.122-1.1.noarch.rpm",
   ensure   => installed,
   #require  => Package['java8'],
}

#Alter /etc/sysconfig/jenkins and change JENKINS_PORT="8000" to JENKINS_PORT="8080"
file_line { 'jenkins_port_line':
  ensure             =>  present,
  path               => '/etc/sysconfig/jenkins',
  line               => 'JENKINS_PORT=8000',
  match              => '^\ JENKINS_PORT\=',
  append_on_no_match => false,
}


 file {'/etc/systemd/system/jenkins.service':
    ensure  => file,
    source  => 'puppet:///modules/jenkins/jenkins.service',
  }
  
 service{'jenkins':
  
    ensure  => running,
    enable  => true,
    #require => [ Package['java8'] , File['/etc/systemd/system/jenkins.service'] ],
  }
  
  
  Package['java8'] ~> Package['jenkins'] ~> File_line['jenkins_port_line'] ~> File['/etc/systemd/system/jenkins.service'] ~> Service['jenkins']
  
}
