resource "aws_security_group" "elk_stack_group" {
	name							=	"elk_stack_group"
	description				= "Allow SSH, HTTP, HTTPS and ELK stack specific ports"
  ingress {
    from_port   		= 22
    to_port     		= 22
    protocol    		= "tcp"
    cidr_blocks 		= ["0.0.0.0/0"]
		description			=	"SSH"
  }
  ingress {
    from_port   		= 80
    to_port     		= 80
    protocol    		= "tcp"
    cidr_blocks 		= ["0.0.0.0/0"]
		description			= "HTTP"
  }
  ingress {
    from_port  			= 443
    to_port    			= 443
    protocol   			= "tcp"
    cidr_blocks			= ["0.0.0.0/0"]
		description			=	"HTTPS"
  }
  ingress {
    from_port  			= 5000
    to_port    			= 5000
    protocol   			= "tcp"
    cidr_blocks			= ["0.0.0.0/0"]
		description			=	"Logstash TCP input"
  }
  ingress {
    from_port  			= 5601
    to_port    			= 5601
    protocol   			= "tcp"
    cidr_blocks			= ["0.0.0.0/0"]
		description			=	"Kibana"
  }
  ingress {
    from_port  			= 9200
    to_port    			= 9200
    protocol   			= "tcp"
    cidr_blocks			= ["0.0.0.0/0"]
		description			=	"Elasticsearch HTTP"
  }
  ingress {
    from_port  			= 9300
    to_port    			= 9300
    protocol   			= "tcp"
    cidr_blocks			= ["0.0.0.0/0"]
		description			=	"Elasticsearch TCP transport"
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
		description   	= "Outbound"
  }
}
