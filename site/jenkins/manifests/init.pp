class jenkins {


  #package { 'java-1.8.0-openjdk':
  #ensure => latest,
  #}
  
  #Ensure the latest version of Java is installed since Jenkins requires JRE v1.8+
  package { 'java':
  
    ensure  => present,
    ensure => latest,
  }
  
}
