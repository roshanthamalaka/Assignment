#Web Server security Group 
resource "aws_security_group" "websg" {
  name        = "websg"
  description = "Allow SSH and Web Traffic"
  vpc_id      = aws_vpc.myvpc.id



   ingress {
    description      = "TLS from VPC"
    from_port        = 5000
    to_port          = 5000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] #Since the Application run on 5000 port
   
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] #For simplicity
   
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "websg"
  }

    depends_on = [aws_vpc.myvpc]

}




