variable "instance_type" {
  description = "value of  ec2 instance type"
  type        = string
  default     = "t3.large"
}

variable "ami_id" {
  description = "value of ami id"
  type        = string
  
}

variable "access_key" {
  description = "value of access key"
  type        = string
  
}

variable "secret_key" {
  description = "value of secret key"
  type        = string
}
  