# Configure the AWS Provider
provider "aws" {
  region     = "us-east-2"
  access_key = "AKIAY4DQ"
  secret_key = "ViiCETPa"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  count           = var.instance_count
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.small"
  security_groups = ["launch-wizard-4"]
  key_name        = "ubuntu"
  user_data       = file("a.sh")
  tags = {
    Name = "Terra-${count.index + 1}"
  }
}

variable "instance_count" {
  default = "19"
}

