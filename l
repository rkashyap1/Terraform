resource "aws_vpc" "default" {
	cidr_block	= "${var.vpc_cidr}"
	}

#Creating Publet Subnet

resource "aws_subnet" "default" {
	vpc_id = "${aws_vpc.default.id}"
	cidr_block = "${var.Public_subnet_CIDR}"
	availability_zone = "ap-south-1a"
	tags	{
		Name = "Public Subnet"
		}
	}
