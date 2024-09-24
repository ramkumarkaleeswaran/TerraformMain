provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA2UC27VATXAR6VH4V"
  secret_key = "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"
} 


# demo temp EC2 start

resource "aws_instance" "demo_instance_temp" {
    ami = "ami-0ad21ae1d0696ad58"
    instance_type = "t2.micro"
    key_name = "scrunworks-sandbox"
    subnet_id = "subnet-00fa64a7edd6e8289"
    root_block_device {
      volume_size = 50
    }
    vpc_security_group_ids = [ aws_security_group.demo_temp_sg1.id ]

    tags = {
    Name = "Temp Demo ec2"
  }
}




# demo  EC2 end


/* Security group for Kriya main app start */

resource "aws_security_group" "demo_temp_sg1" {
  name        = "demo_temp_sg1"
  vpc_id      = "vpc-03ed02f5d15f66cc0"
  description = "Security group for demo temp"
}



