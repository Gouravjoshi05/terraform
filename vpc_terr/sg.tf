#------------ Bastion SG ------------------------

resource "aws_security_group" "bastion_sg" {
  name = "Bastion Security Group"
  vpc_id      = "${module.vpc.vpcid}"

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Bastion"
  }
}

#output "bastion" {
#        value = "${aws_security_group.bastion_sg.id}"
#}


#------------ Jenkins SG ------------------------

resource "aws_security_group" "jenkins_sg" {
  name = "Jenkins Security Group"
  vpc_id      = "${module.vpc.vpcid}"

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
      from_port = 8080
      to_port = 8080
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Jenkins"
  }
}

#------------ nginx SG ------------------------

resource "aws_security_group" "nginx_sg" {
  name = "Nginx Security Group"
  vpc_id      = "${module.vpc.vpcid}"

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Nginx"
  }
}

#------------ Tomcat  SG ------------------------

resource "aws_security_group" "tomcat_sg" {
  name = "Tomcat Security Group"
  vpc_id      = "${module.vpc.vpcid}"

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Tomcat"
  }
}

#------------ Mysql  SG ------------------------

resource "aws_security_group" "mysql_sg" {
  name = "mysql Security Group"
  vpc_id      = "${module.vpc.vpcid}"

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 3306
      to_port = 3306
      protocol = "tcp"
      cidr_blocks = ["${module.tomcat.private_ip}/32"]
  }

  tags = {
    Name = "Mysql"
  }
}

