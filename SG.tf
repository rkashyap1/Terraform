resource "aws_security_group" "private-1a" {
	vpc_id = "${aws_vpc.default.id}"
	description = "SG for private instances"
	name = "PRIVATE SG"
	tags	{
		name = "${var.SG_name}"
		}
	ingress {
		from_port = 0
		to_port = 65535
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
		}
	egress {
		from_port = 0
                to_port = 65535
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
                }
	}

