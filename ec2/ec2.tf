resource "aws_instance" "web" {
  ami           = "ami-0f3c7d07486cad139"  #devops-practice
  instance_type = "t2.micro"
  subnet_id = "subnet-0285fed2480af3f37"
  vpc_security_group_ids = [aws_security_group.roboshop-all.id]
  
tags = {
    Name = "HelloTerraform"
  }
}

resource "aws_security_group" "roboshop-all" {  # this is terraform name, for terraform reference only
  name        = "roboshop-all-aws"                  # this is aws name
  description = "Allow roboshop inbound traffic"
  #vpc_id      = aws_vpc.main.id      # If we are not giving default vpc, it will take default vpc.
ingress {
    description      = "Allow All Ports"
    from_port        = 0  # zero means allowing all ports, otherwisw give specific port
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]  # CIDR internet reference is 0.0.0.0/0
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]  #we are working with ipv4, so commenting ipv6
  }

egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]                      #we are working with ipv4, so commenting ipv6
}
tags = {
    Name = "allow_roboshop"
  }
}
