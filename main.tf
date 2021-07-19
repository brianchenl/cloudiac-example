
provider "alicloud" {
  region = "cn-beijing"
}

resource "alicloud_vpc" "default" {
  vpc_name = var.vpc_name
  cidr_block = var.cidr_block
}

resource "alicloud_vswitch" "default" {
  vpc_id = alicloud_vpc.default.id 
  cidr_block = var.cidr_block
  zone_id = var.zone
}

resource "alicloud_security_group" "default" {
  name = var.sg_name
  vpc_id = alicloud_vpc.default.id
}

resource "alicloud_security_group_rule" "allow_all_tcp" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "1/65535"
  priority          = 1
  security_group_id = alicloud_security_group.default.id
  cidr_ip           = "0.0.0.0/0"
}

resource "alicloud_ecs_key_pair" "default" {
  key_pair_name = var.key_name
  public_key    = var.public_key
}

resource "alicloud_instance" "web" {
  count                = var.instance_number

  availability_zone = var.zone
  security_groups = alicloud_security_group.default.*.id
  instance_type        = var.instance_type
  system_disk_category = "cloud_efficiency"
  image_id             = "ubuntu_18_04_64_20G_alibase_20190624.vhd"
  instance_name        = var.instance_name

  key_name   = alicloud_ecs_key_pair.default.key_pair_name
  vswitch_id = alicloud_vswitch.default.id

  internet_max_bandwidth_out = 1
}

// 为每个计算资源创建一个对应的 ansible_host 资源，
// 执行 ansible playbook 前会基于 ansible_host 资源自动生成 inventory 文件。
resource "ansible_host" "web" {
  count = var.instance_number

  // 配置机器的 hostname，一般配置为计算资源的 public_ip (或 private_ip)
  inventory_hostname = alicloud_instance.web[count.index].public_ip

  // 配置机器所属分组
  groups = ["web"]

  // 传给 ansible 的 vars，可在 playbook 文件中引用
  vars = {
    wait_connection_timeout = 600
  }
}

