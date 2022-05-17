variable "access_key" {
    default = "AKIA3RF6G6PEMZUU7HPB"
    
}

variable "secret_key" {
    default = "HK+ic+xCRlCJWJpTuTgMveRT/jQpLLKi1z7yv2G5"
    
}



variable "vpc-cidr" {
    default = "10.0.0.0/16"
    description = "VPC CIDR Block"
    type = string 
}

variable "public-subnet-1-cidr" {
    default = "10.0.0.0/24"
    description = "Public Subnet 1 CIDR Block"
    type = string 
}

variable "public-subnet-2-cidr" {
    default = "10.0.1.0/24"
    description = "Public Subnet 2 CIDR Block"
    type = string 
}


variable "ami-Practice1" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = "ami-09ed03e97033b6d21"
}

variable "ami-Practice2" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = "ami-0d2aa5df6e106903e"
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}

variable "availability_zone-Practice1" {
  description = "AZ to start the instance in"
  type        = string
  default     = "ap-south-1a"
}

variable "availability_zone-Practice2" {
  description = "AZ to start the instance in"
  type        = string
  default     = "ap-south-1b"
}

variable "aws_security_group_1" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = ["sg-081c84276d1ed0f41"]
}

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource"
  type        = string
  default     = "mumbaiKP"
}

variable "aws_iam_role" {
  default = "sample_1"
}
