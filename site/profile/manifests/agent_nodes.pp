class profile::agent_nodes {
  include dockeragent
  
  dockeragent::node {'web.puppet.vm':}
  dockeragent::node {'db.puppet.vm':}
  
  host {'web.puppet.vm':
    ensure  => present,
    ip      => '10.0.2.15',
  }
  
  host {'db.puppet.vm':
    ensure  => present,
    ip      => '172.18.0.3',
  }
  
  
}
