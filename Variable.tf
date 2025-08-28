variable "ec2_aws_type" {
    default = "t2.micro"
}

variable "ec2_ami_id" {
    default = "ami-020cba7c55df1f615"
}

variable "aws_default_ec2_volume_size" {
    default = 10
}

variable "ec2_volume_type" {
    default = "gp3"
}


variable "env" {
    default = "prd" 
}