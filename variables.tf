# Variables TF File
variable "region" {
  description = "AWS Region "
  default     = "eu-central-1"
}

variable "ami_id" {
  description = "AMI ID to be used for Instance "
  default     = "ami-03c3a7e4263fd998c"
}

variable "instancetype" {
  description = "Instance Type to be used for Instance "
  default     = "t2.micro"
}

variable "subnetid" {
  description = "Subnet ID to be used for Instance "
  default     = "subnet-0096e7c6590fa9610"
}

variable "vpcid" {
  description = "Vpc to be used for Instance "
  default     = "vpc-091a1c48837c5a783"
}


variable "AppName" {
  description = "Application Name"
  default     = "nginx-webserver"
}

variable "Env" {
  description = "Application Name"
  default     = "Dev"
}

variable "HostIp" {
  description = " Host IP to be allowed SSH for"
  default     = "202.65.147.137/32"
}

variable "PvtIp" {
  description = " subnet IP to be allowed SSH for"
  default     = "10.128.1.0/24"
}

variable "jenkinsIp" {
  description = " jenkins IP to be allowed SSH for"
  default     = "54.93.194.138/32"
}

variable "PocIp" {
  description = " Poc IP to be allowed SSH for"
  default     = "3.122.60.120/32"
}

