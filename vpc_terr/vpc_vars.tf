/*--------------------------------------------------------*/

####  Provider Info

variable "region" {
  default = "ap-south-1"
}
variable "creds" {
  default = "/home/opstree/.aws/credentials"
}
variable "profile" {
  description = "AWS credentials profile you want to use"
  default = "default"
}

/*--------------------------------------------------------*/

####  AWS Region

variable "aws_region" {
  default = "ap-south-1"
}

/*--------------------------------------------------------*/

####  VPC CIDR

variable "vpc_cidr" {
  description = "Cidr Range for VPC"
  default = "10.0.0.0/16"
}
variable "vpc_tagname" {
  description = "Tag Name For VPC"
  default = "hcl-assignment"
}

/*--------------------------------------------------------*/

####  Internet Gateway

variable "igw_name" {
  default = "VPC Internat Gateway"
}

/*--------------------------------------------------------*/

####  Public Route Table

variable "public_route_table_cidr" {
  default = "0.0.0.0/0"
}
variable "public_route_table_tagname" {
  default = "Public Route Table"
}

/*--------------------------------------------------------*/

####  Private Route Table

variable "private_route_table_cidr" {
  default = "0.0.0.0/0"
}
variable "private_route_table_tagname" {
  default = "Private Route Table"
}

/*--------------------------------------------------------*/

###  Nat Gateway

variable "eip_name" {
  description = "name of eip for nat"
  default = "Nat_eip"
}

variable "nat_name" {
  description = "name of nat"
  default = "NAT_AZ_A"
}

/*--------------------------------------------------------*/

####  Public Subnet 1-a

variable "pubsubnet1_cidr" {
  description = "Cidr Range for Public Subnet "
  default = "10.0.1.0/24"
}
variable "pubsubnet1_az" {
  default = "ap-south-1a"
}
variable "pubsubnet1_name" {
  default = "Public Subnet A"
}

/*--------------------------------------------------------*/

####  Private Subnet 1-a

variable "prvsubnet1_cidr" {
  description = "Cidr Range for private Subnet "
  default = "10.0.2.0/24"
}
variable "prvsubnet1_az" {
  default = "ap-south-1a"
}
variable "prvsubnet1_name" {
  default = "Private Subnet A"
}
