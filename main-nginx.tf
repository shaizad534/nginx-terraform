# Create key using awscli
# aws ec2 create-key-pair --key-name nginx-webserver --query 'KeyMaterial' --output text >nginx-webserver.pem
#

provider "aws" {
  region = var.region
}

# EC2 resource

resource "aws_instance" "nginx-webserver" {
  ami                    = var.ami_id
  instance_type          = var.instancetype
  key_name               = "nginx-webserver"
  subnet_id              = var.subnetid
  vpc_security_group_ids = [aws_security_group.nginx-webserver.id]

  user_data = file("user-data.sh")
  tags = {
    Name = var.AppName
    Env  = var.Env
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Adding Security Group for our Instance :
resource "aws_security_group" "nginx-webserver" {
  name        = "nginx-webserver-sg"
  description = "nginx-webserver Security Group"
  vpc_id      = var.vpcid
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.HostIp]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.PocIp]
  }


  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.HostIp]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.PvtIp]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}

#Adding Eip to the instance

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.nginx-webserver.id
  allocation_id = aws_eip.nginx-eip.id
}

resource "aws_eip" "nginx-eip" {
  vpc = true
}
