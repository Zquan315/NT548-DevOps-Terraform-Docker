resource "aws_instance" "nhom16_ec2_public_dev" {
  associate_public_ip_address = var.associate_public_ip_address
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id_public
  vpc_security_group_ids      = var.security_group_id_public
  key_name                    = var.key_name
  tags = {
    Name = var.ec2_tag_name_dev
  }
  iam_instance_profile        = var.ec2_instance_profile_name   
  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }
  user_data = <<-EOF
              #!/bin/bash 
              mkdir /home/ubuntu/student-management-app 
              sudo chown -R ubuntu:ubuntu /home/ubuntu/student-management-app 
              sudo chmod -R 777 /home/ubuntu/student-management-app
              sudo apt update -y 
              sudo apt install -y ruby wget 
              cd /home/ubuntu 
              wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install 
              chmod +x ./install 
              sudo ./install auto 
          EOF
}

# Allocate an Elastic IP
resource "aws_eip" "nhom16_eip_dev" {
    network_border_group = var.region_network_border_group
    instance = aws_instance.nhom16_ec2_public_dev.id
    tags = {
        Name = "nhom16_eip_dev"
    }
}


resource "aws_instance" "nhom16_ec2_public_prod" {
  associate_public_ip_address = var.associate_public_ip_address
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id_public
  vpc_security_group_ids      = var.security_group_id_public
  key_name                    = var.key_name
  tags = {
    Name = var.ec2_tag_name_prod
  }
  iam_instance_profile        = var.ec2_instance_profile_name   
  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }
  user_data = <<-EOF
              #!/bin/bash 
              mkdir /home/ubuntu/student-management-app 
              sudo chown -R ubuntu:ubuntu /home/ubuntu/student-management-app 
              sudo chmod -R 777 /home/ubuntu/student-management-app
              sudo apt update -y 
              sudo apt install -y ruby wget 
              cd /home/ubuntu 
              wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install 
              chmod +x ./install 
              sudo ./install auto 
          EOF
}

resource "aws_eip" "nhom16_eip_prod" {
    network_border_group = var.region_network_border_group
    instance = aws_instance.nhom16_ec2_public_prod.id
    tags = {
        Name = "nhom16_eip_prod"
    }
}