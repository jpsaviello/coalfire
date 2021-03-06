variable "region" {
  default     = "us-east-1"
  type        = string
  description = "Region of the VPC"
}


variable "cidr_block" {
  default     = "10.1.0.0/16"
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr_blocks" {
  default     = ["10.1.0.0/24", "10.1.1.0/24"]
  type        = list
  description = "List of public subnet CIDR blocks"
}

variable "private_subnet_cidr_blocks" {
  default     = ["10.1.2.0/24", "10.1.3.0/24"]
  type        = list
  description = "List of private subnet CIDR blocks"
}

variable "availability_zones" {
  default     = ["us-east-1a", "us-east-1b"]
  type        = list
  description = "List of availability zones"
}

variable "vpc_id" {
  type = string
  default = "vpc-0b16b8f92124eb6d5"
}
 
variable "my_bucket" {
  description = "creating a bucket"
  type = string
  default = "my_s3_bucket"
}

variable "force_destroy" {
  type        = string
  default     = true
}
