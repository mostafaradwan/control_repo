class jenkins {

  #Ensure the latest version of Java is installed since Jenkins requires JRE v1.8+
  package { 'java8':
  
    name   => 'java-1.8.0-openjdk',
    ensure => latest,
  }
  
  #Add the Jenkins repo to yum in case it's not there
  package { "jenkins":
  
    provider => rpm,
    source => "http://pkg.jenkins-ci.org/redhat/jenkins-2.122-1.1.noarch.rpm",
    ensure => installed,
}
  
  #Install Jenkins
  package { 'jenkins':
  
     ensure  => present,
     require => [ Package["java8"],Package['jenkins'] ] ,
}
  
}
