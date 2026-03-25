# define all configuration values in single file
instance_type = "t2.micro"
ec2_root_block_config = {
  var_size = 30
  var_type = "gp3"
}

additional_tags = {
  dept = "QA"
  project = "ec2-test-server"
}

# now i need all variables
# for *.auto.tfvars we only want some var for production environment, so we can create another file for dev environment and keep all variables in that file, and use that file for dev environment. and for production we can use *.auto.tfvars file. so we can separate our configuration for different environment.   
# that i onlywant to change ec2_root_block_config in production env, rest all are same.

# so create file prod.auto.tfvars 
# and put only ec2_root_block_config variable in that file, and rest all variables in this file. and for dev environment we can use this file. and for production environment we can use both files, because *.auto.tfvars file will automatically load by terraform. so for production environment we can use both files, and for dev environment we can use only this file. so we can separate our configuration for different environment.

