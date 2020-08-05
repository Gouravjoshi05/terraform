provider "aws" {
    region = "ap-southeast-1"
    profile = "aws-dcm"
}
resource "aws_vpc" "myvpc" {
  cidr_block       = var.cidr
  #instance_tenancy = "dedicated"

  tags = {
    Name = var.vpc_name
    Project = var.project
    Purpose = var.purpose
    Owner = var.owner
    Environment = var.environment
  }
}



######IGW######
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.myvpc.id

    tags = {
      Name = "publicIGW"
      Project = var.project
      Purpose = var.purpose
      Owner = var.owner
      Environment = var.environment
    }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.myvpc.id
  count   = var.subnets
  cidr_block        = local.public_cidrs[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  # cidr_block   = element(values(var.public_subnets), count.index)

  tags = {
    Name       = "${var.purpose}-public"
    Decription = "${var.purpose}-vpc public subnet with direct access to internet gateway"
    Project = var.project
    Purpose = var.purpose
    Owner = var.owner
    Environment = var.environment
    az         = data.aws_availability_zones.available.names[count.index]
    type       = "public"
  }
}

########################################
#          Private SUBNET              #
#######################################
resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.myvpc.id
  count  = var.subnets
  cidr_block  = local.private_cidrs[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  #cidr_block  = element(values(var.private_subnets), count.index)


  tags = {
    Name       = "${var.purpose}-private"
    Decription = "${var.purpose}-vpc public subnet with direct access to internet gateway"
    Project = var.project
    Purpose = var.purpose
    Owner = var.owner
    Environment = var.environment
    az = data.aws_availability_zones.available.names[count.index]
    type = "private"
  }
}

resource "aws_eip" "eip" {
  vpc      = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  #subnet_id = "${aws_subnet.public_subnet.*.id}"
  subnet_id = aws_subnet.public_subnet.*.id[0]

  tags = {
    Name       = var.purpose
    Decription = "${var.purpose}-vpc private subnet with direct access to internet"
    Project = var.project
    Purpose = var.purpose
    Owner = var.owner
    Environment = var.environment
  }
}

############ publicRT############
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.myvpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
      Name = "publicRT"
      Project = var.project
      Purpose = var.purpose
      Owner = var.owner
      Environment = var.environment
      type = "public"
    }
}

############ privateRT############
resource "aws_route_table" "private" {
    vpc_id = aws_vpc.myvpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.nat.id
    }

    tags = {
      Name = "privateRT"
      Project = var.project
      Purpose = var.purpose
      Owner = var.owner
      Environment = var.environment
      type = "private"
    }
}

# TerraformRTAPublic
resource "aws_route_table_association" "public" {
    count   = var.subnets
    subnet_id = element(aws_subnet.public_subnet.*.id,count.index)
    route_table_id = aws_route_table.public.id
}
# TerraformRTAPrivate
resource "aws_route_table_association" "private" {
    count   = var.subnets
    subnet_id = element(aws_subnet.private_subnet.*.id,count.index)
    route_table_id = aws_route_table.private.id
}
