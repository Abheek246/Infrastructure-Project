# first we will create VPC
resource "aws_vpc" "my_vpc"{
    cidr_block = var.cidr

    tags={
        Name = "Main vpc"
    }

}

resource "aws_security_group" "security_group_1" {
    
    name = var.security_group

    



    ingress {
        from_port = 8080               # Allows incoming (ingress) traffic on port 8080 (used by Jenkins web UI).
        to_port = 8080
        protocol = "tcp"               # Accept TCP connections.
        cidr_blocks = ["0.0.0.0/0"]     # Anyone on the internet can try to access Jenkins UI (port 8080)
    }

    ingress {
        from_port = 22    # Allows SSH access to the EC2 instance.
        to_port = 22 
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"] # Anyone on the internet can try to access SSH into your server (port 22)
    }
    egress {
        from_port = 0       #  [ from_port = 0 , to_port = 65535 means allow the ec2 instance to send the traffic or data to the internet using all tcp port] 
        to_port = 65535
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]  #[In egress this block means the EC2 instance can send the data or traffic anywhere on the internet ]
    }

}

resource "aws_instance" "my-instance" {
   ami = var.ami-id
   key_name = var.key-name
   instance_type = var.instance-type
   vpc_security_group_ids = [aws_security_group_security_group_1_id]
   tags = {
    Name = "my_EC2_instance"
   }

}
