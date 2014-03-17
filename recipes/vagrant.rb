node.override['set_fqdn'] = '*.zooniverse.local'
node.override['monit']['mail_alerts'] = false
node.override['storm']['zookeeper_hosts'] = [
  'zk1.zooniverse.local',
  'zk2.zooniverse.local',
  'zk3.zooniverse.local'
]

node.override['storm']['nimbus_host'] = 'nimbus.zooniverse.local'

include_recipe 'zoo-storm::default'
