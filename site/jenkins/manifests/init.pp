class jenkins {

  #Ensure the latest version of Java is installed since Jenkins requires JRE v1.8+
  package { 'java':
    
    ensure => latest,
  }
  
  
  #service {'jenkins':  
   # ensure  => running,
   #enable  => true,
   # require => Package['java'],
  #}
  
}
