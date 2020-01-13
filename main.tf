provider "aws" {
	profile = "default"
  access_key = var.aws_credentials[0]
  secret_key = var.aws_credentials[1]
  region     = "eu-west-3"
}

resource "aws_instance" "elk_stack" {
	count						=	1
  ami           	= "ami-087855b6c8b59a9e4"
  instance_type 	= "t2.medium"
	security_groups = ["elk_stack_group"]
	tags = {
		Name					=	"ELK-Stack"
	}
  key_name 				= aws_key_pair.default.key_name
	user_data				=	file("./scripts/buildDocker.sh")
	connection {
		type					=	"ssh"
		user					=	"ubuntu"
		host					=	"self.public_ip"
		private_key		= file("/home/daniel/.ssh/danielaws.pem")
	}
}
