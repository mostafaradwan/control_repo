class jenkins {

  #Ensure the latest version of Java is installed since Jenkins requires JRE v1.8+
  package { 'java8':
  
    name   => 'java-1.8.0-openjdk',
    ensure => latest,
  }
  
  
  
 
  
}
