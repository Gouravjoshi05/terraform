/*-----------------------------------------*/
/*----- EC2 ----------------------*/
/*-----------------------------------------*/

variable "ec2_ami" {
    default = "ami-07c6dd0f2f7c4cbbe"
}
variable "ec2_instance_type" {
    default = "t2.micro"
}

