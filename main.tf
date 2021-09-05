data "aws_ami" "ubuntu_ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}

resource "aws_eip" "eth0_public_ip" {
  vpc                       = true
  network_interface         = aws_network_interface.eth0.id
  # associate_with_private_ip = "10.1.1.10"
}

resource "aws_network_interface" "eth0" {
  subnet_id         = var.subnet_public_id
  # private_ips       = [ var.private_ip2 ]
  security_groups   = [ var.security_group_public_id ]
  source_dest_check = false
}

resource "aws_network_interface" "eth1" {
  subnet_id         = var.subnet_private_id
  # private_ips       = [ var.private_ip2 ]
  security_groups   = [ var.security_group_private_id ]
  source_dest_check = false
}

resource "aws_instance" "EC2_1" {
  tags = { Name = var.name }
  ami  = data.aws_ami.ubuntu_ami.id
  instance_type = var.instance_type
  key_name = var.key_name
  
  network_interface {
    network_interface_id = aws_network_interface.eth0.id
    device_index         = 0
  }

  network_interface {
    network_interface_id = aws_network_interface.eth1.id
    device_index         = 1
  }

  user_data = templatefile( "${path.module}/init.sh", { host = var.name } )
  # provisioner "local-exec" {
  #   command = "echo Public IP ${aws_instance.EC2_1.public_ip}"
  # }
  # provisioner "remote-exec" {
  #   inline = [ "cloud-init status --wait" ]
  # }

}