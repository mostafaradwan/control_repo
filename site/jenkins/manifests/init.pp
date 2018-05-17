class jenkins {

  #Ensure the latest version of Java is installed since Jenkins requires JRE v1.8+
  package { 'java8':
  
    name   => 'java-1.8.0-openjdk',
    ensure => latest,
  }
  
  #Add the Jenkins repo to yum in case it's not there
  yumrepo { 'jenkins-yum-repo':
  
    baseurl => "http://pkg.jenkins-ci.org/redhat/jenkins.repo",
    enabled => 1,
}
  
  #Install Jenkins
  package { 'jenkins':
  
     ensure  => present,
     require => [ Yumrepo["jenkins-yum-repo"],Package['Java8'] ] ,
}
  
}
