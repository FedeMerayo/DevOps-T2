provider "aws" {
    region = "us-east-2" # Cambia esto a la regi¾n deseada
    }

resource "aws_security_group" "instance_security_group" {
name = "instance_security_group"
description = "Security group for EC2 instance"
    
ingress {
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

ingress {
from_port = 443
to_port = 443
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

ingress {
from_port = 3000
to_port = 3000
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

egress {
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

egress {
from_port = 443
to_port = 443
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

egress {
from_port = 3000
to_port = 3000
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

}
    
resource "aws_instance" "Pagos_dev_instance" {
    ami = "ami-019f9b3318b7155c5" # AMI de Amazon Linux
    instance_type = "t2.micro" # Tipo de instancia
    key_name = "vockey" # Nombre de tu key pair existente en AWS
    
        vpc_security_group_ids = [aws_security_group.instance_security_group.id]
        tags = {
    Name = "ORG-PAGOS-DEV" #Reemplazar por el nombre correcto
    }


    }
        output "public_ip_dev" {
    value = aws_instance. Pagos_dev_instance.public_ip
    }

