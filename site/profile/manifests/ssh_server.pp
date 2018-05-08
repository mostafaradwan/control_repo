class profile::ssh_server {
  package {'openssh-server':
    ensure => present,
  }
  service { 'sshd':
    ensure => 'running',
    enable => 'true',
  }
  ssh_authorized_key { 'root@master.puppet.vm':
    ensure => present,
    user   => 'root',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDdxNk/HFsNoNs56X8qkjw9f2cphe8aOTstDrvi6OpcbjO4xyGq0Codofy76ZS5liK+LxK9I+0V+316+1BuhNU7bhIRnZQ4qdauNld5VldD+RKWt3OihJB+hqrvSidk8TLbSGRbutYv6iUJcmiVXqBjS6sjkcHicU2KGqSU9zD2GVz9qiKLWPypDkV0BqKeafiCHS4La81acXyVBQwN9KA0Vi59G2GFTv7u8Dd+DI+X6qaaFDCTbD3ywuzU+7LMJtFYUTC0Smkeu5TaAag3P/Kffa7e0UqH4GT+xMbBvV3BmUsNBRDq4NtwuzkL9yESIrXPv3Uqs5oCAgMszgS1M0Vf',
  }  
}
