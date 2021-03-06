# Destroy all our test resources, created in the create.pp manifest
# Note that due to lifecyles of AWS resouces deleting security groups will
# fail until the corresponding instances have been deleted. This will be
# better modelled in the future.

Ec2_securitygroup {
  region => 'sa-east-1',
}

Ec2_instance {
  region => 'sa-east-1',
}

Elb_loadbalancer {
  region => 'sa-east-1',
}

ec2_instance { ['web-1', 'web-2', 'db-1', 'puppet-1']:
  ensure => absent,
}

elb_loadbalancer { 'lb-1':
  ensure => absent,
}

ec2_securitygroup { ['lb-sg', 'web-sg', 'db-sg', 'puppet-sg']:
  ensure => absent,
}
