variable "vpc_name" {
  type    = string
  default = "final-task-vpc"
}
variable "cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "azs" {
  type    = list(string)
  default = ["ap-south-1a", "ap-south-1b"]
}
variable "public_subnet_cidr_blocks" {
  type = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
}
variable "private_subnet_cidr_blocks" {
  type = list(string)
  default = [
    "10.0.101.0/24",
    "10.0.102.0/24"
  ]
}
variable "instance_count" {
  type    = number
  default = 1
}
variable "region" {
  type    = string
  default = "ap-south-1"
}
variable "enable_blue_env" {
  description = "Enable blue environment"
  type        = bool
  default     = true
}
variable "blue_instance_count" {
  description = "Number of instances in blue environment"
  type        = number
  default     = 1
}
variable "enable_green_env" {
  description = "Enable green environment"
  type        = bool
  default     = true
}
variable "green_instance_count" {
  description = "Number of instances in green environment"
  type        = number
  default     = 1
}
variable "traffic_distribution" {
  description = "Levels of traffic distribution"
  type        = string
}