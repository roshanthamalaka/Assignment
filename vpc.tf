
#Create A VPC 

resource "aws_vpc" "myvpc" {
  cidr_block = "172.16.0.0/16"

  #By Specifying tag like this, Vpc gets the name specified    
  tags = {
    Name = "roshan-tfvnet" #Name of the VNET
  }
}

#Public Subnet 1

resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "172.16.1.0/24"
  availability_zone= "us-east-2a"

  tags = {
    Name = "Public1"
  }

   depends_on = [aws_vpc.myvpc]
}

#Public Subnet 2 

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "172.16.2.0/24"
  availability_zone= "us-east-2b"

  tags = {
    Name = "Public2"
  }
  depends_on = [aws_vpc.myvpc]
}


#Create an Internet Gateway 

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "main"
  }
}




