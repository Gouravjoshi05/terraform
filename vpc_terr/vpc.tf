/*------------------------------------------------------------------------------*/

####  Provider Info

provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "${var.creds}"
  profile                 = "${var.profile}"
}

/*-----------------------------------------------------------------------------*/
####  VPC

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = "${var.vpc_cidr}"
  vpc_name = "${var.vpc_tagname}"
}

/*-----------------------------------------------------------------------------*/

####  IGW

module "igw" {
  source = "./modules/igw"
  vpcid = "${module.vpc.vpcid}"
  igw_name = "${var.igw_name}"
}

/*-----------------------------------------------------------------------------*/

####  Public Route Table

module "public_route_table" {
  source = "./modules/route_table"
  vpcid = "${module.vpc.vpcid}"
  cidr_block = "${var.public_route_table_cidr}"
  igwid = "${module.igw.igwid}"
  rt_name = "${var.public_route_table_tagname}"
}

/*-----------------------------------------------------------------------------*/
###  Nat Gateway

module "nat_gateway" {
  source = "./modules/nat_gateway"
  eip_name = "${var.eip_name}"
  pub_subnet_id = "${module.public_subnet_1.subnet_id}"
  nat_name = "${var.nat_name}"
#  depends_on = "${module.vpc.vpcid}"
}

/*-----------------------------------------------------------------------------*/

####  Private Route Table

module "private_route_table" {
  source = "./modules/route_table"
  vpcid = "${module.vpc.vpcid}"
  cidr_block = "${var.private_route_table_cidr}"
  natgw = "${module.nat_gateway.nat_gw_id}"
  rt_name = "${var.private_route_table_tagname}"
}


/*-----------------------------------------------------------------------------*/

####  Public Subnet 1-a

module "public_subnet_1" {
  source = "./modules/subnet"
  vpcid = "${module.vpc.vpcid}"
  cidr = "${var.pubsubnet1_cidr}"
  az = "${var.pubsubnet1_az}"
  subnet_name = "${var.pubsubnet1_name}"
}


####  Public Subnet 1-a RT Association

module "public_subnet_1_association" {
  source = "./modules/route_table_association"
  subnet_id = "${module.public_subnet_1.subnet_id}"
  rt_id = "${module.public_route_table.rtid}"
}

/*-----------------------------------------------------------------------------*/

####  private subnate 1-a
module "private_subnet_1" {
  source = "./modules/subnet"
  vpcid = "${module.vpc.vpcid}"
  cidr = "${var.prvsubnet1_cidr}"
  az = "${var.prvsubnet1_az}"
  subnet_name = "${var.prvsubnet1_name}"
}


####  Private Subnet 1-a RT Association
module "private_subnet_1_association" {
  source = "./modules/route_table_association"
  subnet_id = "${module.private_subnet_1.subnet_id}"
  rt_id = "${module.private_route_table.rtid}"
}

