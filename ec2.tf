#Create a Key Pair on AWS 
resource "aws_key_pair" "roshank" {
  key_name   = "roshan-tf-key"
  public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAgTQyYs0gUbnKdLq3iYcHH6YUi1Zm77+7My96FXgtYoube5l8bGq87egIUPQHbvYjPszUyMLISf4S4jj5EATOYqUeUQB9N8qBN1h51m7nWejiFHwMsklpjtPmgZ3vRUfv0wU/FvHVBPx/zCs6/x5eD1C9zQzvNZSDQ1M6P8HKst4LZWZGCOA6gbJKlFyZ5uAEmfYB8FmfReOeFUICjnFewpyq/4S+8VjMJMYyAbPXpzXT76bYRAe/o8g2/d0qnBLCbXByUFtv+i+5rWA+16qopDshn/T1Gmi9ntu4d7RWkQkquTIYepWpoFa8RkqIAZPZPw/ARSnyq+jjMRe4nsRHZQIDAQAB"


}



#web Server

resource "aws_instance" "web" {
  ami           = "ami-058d017bb0407da05" #Amazon Linux 2 AMI 
  instance_type = "t2.micro"
  associate_public_ip_address = true
  security_groups = [aws_security_group.websg.id]
  subnet_id = aws_subnet.public1.id
  key_name = aws_key_pair.roshank.key_name


#Establish Connection for provisioner (SSH)

connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("../KeyPair/id_rsa") #Path where Private Key is located 
    host     = self.public_ip # Same Instance Public IP 
   }

#Use file Provisioner to Copy Script to the server 

 
 provisioner "file" {
    source      = "script.sh" # For easynes  this in the same directory 
    destination = "/tmp/script.sh" #Remote Server location to copy the script

    
  }


 # Use remote exec to run the script 

  provisioner "remote-exec" {
     
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo sh /tmp/script.sh",
    ]

  }



  tags = {
    Name = "DockerSWMRT" #VM Name
  }

    depends_on = [aws_vpc.myvpc,aws_key_pair.roshank]

  
} #End of the Web Server resource 



