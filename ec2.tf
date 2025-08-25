# key pair login 

resource aws_key_pair my_key{
    key_name = "terra-ec2-key"
    public_key = file("terra-ec2-key.pub")
} 

#vpc & security group

resource aws_default_vpc deafult {
  
}

resource aws_security_group my_security_group {
    name = "automate-sg"
    description = "this will add a TF genrated Security group"
    vpc_id  = aws_default_vpc.deafult.id #interpolation

#inbound rule 

ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "open SSH"
}

ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "internet"
}

ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "internet"
}

ingress {
    from_port = 8000
    to_port = 8000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Flask App"
}

#outbound rule 

egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "all"
}


tags = {
    Name = "automate-sg"
}
}

#ec2

resource "aws_instance" "my_instance"  {
    #this is for each
    for_each = {
        terra-in-coding-automate-micro = "t2.micro"
        terra-in-coding-automate-medium = "t2.medium"
        terra-in-coding-automate-small = "t2.small"
    }
    #this count 
    count = 3
    key_name = aws_key_pair.my_key.key_name
    security_groups = [aws_security_group.my_security_group.name]
    ami = var.ec2_ami_id #ubuntu
    instance_type = var.ec2_aws_type
    #instance_type = var.value

    user_data = file("install_nginx.sh")

    root_block_device {
        volume_size = var.env == "prod" ? 20 : var.aws_default_ec2_volume_size
        volume_type = var.ec2_volume_type
    }
    tags = {
        Name = "Instance-${count.index + 1}"
        Name = each.key
    }
}


