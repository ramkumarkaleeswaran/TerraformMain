
provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA2UC27VATXAR6VH4V"
  secret_key = "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"
} 

# master EC2 start

resource "aws_instance" "master1" {
    ami = "ami-0ad21ae1d0696ad58"
    instance_type = "t3a.medium"
    key_name = "scrunworks-sandbox"
    subnet_id = "subnet-00fa64a7edd6e8289"
    root_block_device {
      volume_size = 50
    }
    vpc_security_group_ids = [ aws_security_group.mainapp_master_sg1.id ]

    tags = {
    Name = "Master (t): Master branch kriya-mainapp"
  }
}

resource "aws_instance" "master2" {
    ami = "ami-0ad21ae1d0696ad58"
    instance_type = "t3a.large"
    key_name = "scrunworks-sandbox"
    subnet_id = "subnet-00fa64a7edd6e8289"
    vpc_security_group_ids = [ aws_security_group.simplexmldb_master_sg1.id ]
    root_block_device {
      volume_size = 100
    }

    tags = {
    Name = "Master (t): Master branch kriya-simplexmlnodeproxy"
  }
}

resource "aws_ec2_instance_state" "master_test1" {
  instance_id = aws_instance.master1.id
  state       = "running"
}

resource "aws_ec2_instance_state" "master_test2" {
  instance_id = aws_instance.master2.id
  state       = "running"
}

# master  EC2 end



