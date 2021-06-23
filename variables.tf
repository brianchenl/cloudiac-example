variable "instance_number" {
  default = 1
}

variable "region" {
  default = "cn-beijing"
}

variable "zone" {
  default = "cn-beijing-b"
}

variable "vpc_name" {
}

variable "cidr_block" {
}

variable "sg_name" {
  description = "安全组名称"
}

variable "instance_type" {
  description = "计算实例规格"
}

variable "instance_name" {
  description = "计算实例名称"
}

