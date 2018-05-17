class jenkins {

  #Ensure the latest version of Java is installed since Jenkins requires JRE v1.8+
  package { 'java-1.8.0-openjdk':
  
    #name   => 'java-1.8.0-openjdk',
    ensure => installed,
  }
  
 # package { "jenkins":
  
 #  provider => rpm,
 #   source   => "http://pkg.jenkins-ci.org/redhat/jenkins-2.122-1.1.noarch.rpm",
 #   ensure   => installed,
    #require  => Package['java-1.8.0-openjdk'],
#}
 
}
