output "public_ip" {
  value = aws_instance.public_ip.public_ip
}
output "private_ip" {
  value = aws_network_interface.eth0.private_ip
}
output "private_ip2" {
  value = aws_network_interface.eth1.private_ip
}
output "instance_state" {
  value = aws_instance.EC2_1.instance_state
}


