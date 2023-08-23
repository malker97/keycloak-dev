provider "aws" {
    region = "us-west-2"
}
resource "aws_key_pair" "ssh_key" {
    key_name = "ssh_key"
    public_key = file("~/.ssh/id_rsa.pub")
}
resource "aws_security_group" "ssosg" {
    egress = [
        {   ipv6_cidr_blocks = []
            prefix_list_ids = []
            cidr_blocks = [ "0.0.0.0/0" ]
            description = "Allow all outbound traffic by default"
            from_port = 0
            protocol = "-1"
            security_groups = []
            self = false
            to_port = 0
        }
    ]
    ingress = [
        {   ipv6_cidr_blocks = []
            prefix_list_ids = []
            cidr_blocks = [ "0.0.0.0/0" ]
            description = "Allow SSH inbound traffic"
            from_port = 22
            protocol = "tcp"
            security_groups = []
            self = false
            to_port = 22
        },
        {   ipv6_cidr_blocks = []
            prefix_list_ids = []
            cidr_blocks = [ "0.0.0.0/0" ]
            description = "Allow HTTP inbound traffic"
            from_port = 80
            protocol = "tcp"
            security_groups = []
            self = false
            to_port = 80
        },
        {   ipv6_cidr_blocks = []
            prefix_list_ids = []
            cidr_blocks = [ "0.0.0.0/0" ]
            description = "Allow HTTPS inbound traffic"
            from_port = 443
            protocol = "tcp"
            security_groups = []
            self = false
            to_port = 443
        }
    ]
  
}
resource "aws_instance" "sso" {
    # use Ubuntu 22.04 LTS
    ami = "ami-03f65b8614a860c29"
    instance_type = "t2.micro"
    key_name = aws_key_pair.ssh_key.key_name
    security_groups = [ aws_security_group.ssosg.name ]
}
output "instance_ip" {
    value = aws_instance.sso.public_ip
}