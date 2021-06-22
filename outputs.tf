
output "public_ip" {
  value = alicloud_instance.web.*.public_ip
}

