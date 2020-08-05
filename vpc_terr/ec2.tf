


/*--------------------------------------------------------------------------------------------------------*/
/*---------   Bastion Server  ----------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------------------------*/

#module "bastion" {
#  source                 = "./modules/ec2_instance"
#  name                   = "bastion"
#  instance_count         = 1
#
#  ami                    = "${var.ec2_ami}"
#  instance_type          = "${var.ec2_instance_type}"
#  key_name               = "jasamant"
#  monitoring             = false
#  vpc_security_group_ids = ["${aws_security_group.bastion_sg.id}"]
#  subnet_id              = "${module.public_subnet_1.subnet_id}"
#  associate_public_ip_address = true
#
#  tags = {
#	Name = "bastion"
#  }
#}

module "bastion" {
  source                      = "./modules/ec2"
  ssh_key_pair                = "rocky"
  instance_type               = "${var.ec2_instance_type}"
  vpc_id                      = "${module.vpc.vpcid}"
  security_groups             = ["${aws_security_group.bastion_sg.id}"]
  subnet                      = "${module.public_subnet_1.subnet_id}"
  associate_public_ip_address = true
  assign_eip_address          = false
  name                        = "bastion"
  namespace                   = "eg"
  stage                       = "dev"
}


/*--------------------------------------------------------------------------------------------------------*/
/*---------  Jenkins Server  ----------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------------------------*/

module "jenkins" {
  source                      = "./modules/ec2"
  ssh_key_pair                = "rocky"
  instance_type               = "${var.ec2_instance_type}"
  vpc_id                      = "${module.vpc.vpcid}"
  security_groups             = ["${aws_security_group.jenkins_sg.id}"]
  subnet                      = "${module.public_subnet_1.subnet_id}"
  associate_public_ip_address = true
  assign_eip_address          = false
  name                        = "jenkins"
  namespace                   = "eg"
  stage                       = "dev"
}

/*--------------------------------------------------------------------------------------------------------*/
/*---------  Nginx Server  ----------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------------------------*/

module "nginx" {
  source                      = "./modules/ec2"
  ssh_key_pair                = "rocky"
  instance_type               = "${var.ec2_instance_type}"
  vpc_id                      = "${module.vpc.vpcid}"
  security_groups             = ["${aws_security_group.nginx_sg.id}"]
  subnet                      = "${module.public_subnet_1.subnet_id}"
  associate_public_ip_address = true
  assign_eip_address          = false
  name                        = "Ngnix"
  namespace                   = "eg"
  stage                       = "dev"
}


/*--------------------------------------------------------------------------------------------------------*/
/*---------  Tomcat Server  ----------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------------------------*/

module "tomcat" {
  source                      = "./modules/ec2"
  ssh_key_pair                = "rocky"
  instance_type               = "${var.ec2_instance_type}"
  vpc_id                      = "${module.vpc.vpcid}"
  security_groups             = ["${aws_security_group.tomcat_sg.id}"]
  subnet                      = "${module.private_subnet_1.subnet_id}"
  associate_public_ip_address = true
  assign_eip_address          = false
  name                        = "Tomcat"
  namespace                   = "eg"
  stage                       = "dev"
}


/*--------------------------------------------------------------------------------------------------------*/
/*---------  Mysql Server  ----------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------------------------*/

module "mysql" {
  source                      = "./modules/ec2"
  ssh_key_pair                = "rocky"
  instance_type               = "${var.ec2_instance_type}"
  vpc_id                      = "${module.vpc.vpcid}"
  security_groups             = ["${aws_security_group.mysql_sg.id}"]
  subnet                      = "${module.private_subnet_1.subnet_id}"
  associate_public_ip_address = true
  assign_eip_address          = false
  name                        = "Mysql"
  namespace                   = "eg"
  stage                       = "dev"
}

