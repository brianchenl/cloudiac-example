variable "instance_number" {
  default = 1
}

variable "region" {
  default = "cn-beijing"
}

variable "zone" {
  default = "cn-beijing-b"
}

variable "key_name" {
  default = "cloudiac-sample"
}

variable "public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDG/dRII9HA1AMFny7qpKVZdbrxjOQwY18zL4fYvsJN7h0nqx9FX0L9OZrFjSosGeRH75wGdeVfk8p6x9n7KkrB7sUL0kuA2jsLA+4/SIoEjePlWVkOvbShhTn/0OiCRqorazac1mka8ySys7uA6pd5iOFndYq/jAat9uDN47YqSB9IOWHKN0Dz3KwtoYhyqyP0ACXQ9SlJpreLi3Xqvyqet3hDxPxl+AILRTelInujS5p/cbzxo1zXn93XhJS0ArA3idbsKmbWWAfUfkCCvjIhMh4OfR+eRPgKxROsSaMKLM4H7kvY6naVz/XI943Oh5p5Ac95isd6Pu/da3wxmMwmEH/Fk1TSjJK4OcuwzH6J+D2q2vd/TH+/IZje4yi0LllSqsck4rHQCQzZGYRqQm0CtZWoBC+H3FuHxB5rZ0RciSeAv0NzgQ6qXER3clMkdxVvFkAzgyqHAeVdRTi2ooPJoLmesjAcn9iT595j9D9CjMmctz1wU0NGDveihhhdzsk= cloudiac-sample"
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

