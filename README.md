Prerequisites 

•Generate Public and Private Key Pair  for EC2 server authentication.
•Public Should be in a separate Directory called Keypair
•AWS Account 
•PC with Terraform installation 

Deployment 

In order to Deploy the solution Follow below steps 

Clone the Repository to the Local PC
Follow below commands in exact order 
•“terraform init”
•“terraform plan”
•“terraform apply”

This will Create required infrastructure in AWS Cloud  with Application 

High Level Architecture 

In order to provision the Application, used the docker swarm as container orchestration. EC2 instance running a docker and docker swarm. 

1.There is a VPC which a Public Subnet where all the  internet traffic is routed via internet gateway 
2.EC2 instance is deployed in Public Subnet where the docker installed 
3.Allowed SSH and 5000 traffic from any where using Security Group 
4.In Network Access Control (NACL) List all the Traffic is allowed 

Improvements 

1.Currently Application is deployed on Single EC2 instance with one Docker swarm master
2.In order to achieve high availability has to use docker swarm cluster with EC2 instances in multiple Availability Zones 
3.For Simplicity Allowed all traffic from NACL. These rules should be properly implemented. 






