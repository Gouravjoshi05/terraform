variable "vpc_name" {
  default = "myvpc"
}
variable "project" {
  default = "myown"
}
variable "purpose" {
  default = "learning"
}
variable "vpc_id" {
  default = "vpc-0382ad828b646111a"
}
# variable "public_rt" {
#   default = ""
# }
variable "port" {
  default = "0"
}
variable "cidr_block" {
  type = "list"
  default = ["0.0.0.0/0"]
}
