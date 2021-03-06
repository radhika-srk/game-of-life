#global parameters
variable "region" {
  description = "Region"
}
variable "aws_accesskey" {
  type = "string"
}
variable "aws_secretkey" {
  type = "string"
}
variable "availability_zones" {
  description = "availabilityzones that are going to be used for the subnets"
} 
#ec2 parameters
variable "ami" {
  description = "image id to launch"
}
variable "key_name" {
  description = "keyname"
}
variable "instance_type" {
  description = "instancetype to launch"
}





