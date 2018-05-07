#----------------------------------------------#
		#VPC#
#----------------------------------------------#
#VPC SETUP

resource "aws_vpc" "default" {
	cidr_block = "${var.vpc_cidr}"
	tags	{
		Name = "${var.vpc_name}"
		}
	}

#----------------------------------------------#
		#PUBLIC SUBNET
#----------------------------------------------#
#PUBIC SUBNET SETUP

resource "aws_subnet" "Public-1a" {
	vpc_id = "${aws_vpc.default.id}"
	cidr_block = "${var.Public_subnet1a_CIDR}"
	availability_zone = "${var.private1a_az}"
	tags	{
		Name = "${var.Public_subnet1a_Name}"
		}
	}
resource "aws_subnet" "Public-1b" {
	vpc_id = "${aws_vpc.default.id}"
	cidr_block = "${var.Public_subnet1b_CIDR}"
	availability_zone = "${var.private1b_az}"
	tags 	{
		Name = "${var.Public_subnet1b_Name}"
		}
	}


#----------------------------------------------#
		#PRIVATE SUBNET#
#----------------------------------------------#
#PRIVATE SUBNET SETUP

resource "aws_subnet" "Private-1a" {
	vpc_id = "${aws_vpc.default.id}"
	cidr_block = "${var.Private_subnet1a_CIDR}"
	availability_zone = "${var.private1a_az}"
	tags	{	
		Name = "${var.Private1A_Name}"
		}
	}
resource "aws_subnet" "Private-1b" {
	vpc_id = "${aws_vpc.default.id}"
	cidr_block = "${var.Private_subnet1b_CIDR}"
	availability_zone = "${var.private1b_az}"
	tags	{
		Name = "${var.Private1B_Name}"
		}
	}

#----------------------------------------------#
                #INTERNET GATEWAY#
#----------------------------------------------#
#Internet Gateway for Publica Subnet

resource "aws_internet_gateway" "gw" {
	vpc_id	= "${aws_vpc.default.id}"
	tags	{
		Name = "New_VPC_IGW_1A"
		}
	}

#----------------------------------------------#
                #ROUTE SETUP#
#----------------------------------------------#
#Enabling route for Public subnet
resource "aws_route_table" "default-a" {
	vpc_id = "${aws_vpc.default.id}"
	route	{
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.gw.id}"
		}
	}

resource "aws_route_table" "default-private-a" {
	vpc_id = "${aws_vpc.default.id}"
	route	{
		cidr_block = "0.0.0.0/0"
		nat_gateway_id = "${aws_nat_gateway.gw-a.id}"
		}
	}

resource "aws_route_table" "default-private-b" {
	vpc_id = "${aws_vpc.default.id}"
	route	{
		cidr_block = "0.0.0.0/0"
		nat_gateway_id = "${aws_nat_gateway.gw-b.id}"
		}
	}
#----------------------------------------------#
#----------------------------------------------#
                #ROUTER SUBNET ASSOCIATIO#
#----------------------------------------------#
#SUBNET ASSOCIATION

resource "aws_route_table_association" "Public_ap-south-1a" {
	subnet_id = "${aws_subnet.Public-1a.id}"
	route_table_id = "${aws_route_table.default-a.id}"
	}

resource "aws_route_table_association" "Public_ap-south-1b" {
	subnet_id = "${aws_subnet.Public-1b.id}"
	route_table_id = "${aws_route_table.default-a.id}"
	}


resource "aws_route_table_association" "private-ap-1a" {
	subnet_id = "${aws_subnet.Private-1a.id}"
	route_table_id = "${aws_route_table.default-private-a.id}"
	}

resource "aws_route_table_association" "private-ap-1b" {
	subnet_id = "${aws_subnet.Private-1b.id}"
	route_table_id = "${aws_route_table.default-private-b.id}"
	}

#------------------------------------------------------------#
#	                ELASTIC IP			     #
#------------------------------------------------------------#
resource "aws_eip" "eip1" {
	vpc = "true"
	depends_on = ["aws_internet_gateway.gw"]
	}

resource "aws_eip" "eip2" {
	vpc = "true"
	depends_on = ["aws_internet_gateway.gw"]
	}

#------------------------------------------------------------#
#			NET GATEWAY			     #
#------------------------------------------------------------#
resource "aws_nat_gateway" "gw-a" {
	allocation_id = "${aws_eip.eip1.id}"
	subnet_id = "${aws_subnet.Public-1a.id}"
	depends_on = ["aws_internet_gateway.gw"]
	}

resource "aws_nat_gateway" "gw-b" {
	allocation_id = "${aws_eip.eip2.id}"
	subnet_id = "${aws_subnet.Public-1b.id}"
	depends_on = ["aws_internet_gateway.gw"]
	}

#------------------------------------------------------------#
	             #SECURITY GROUP#                         
#------------------------------------------------------------#
resource "aws_security_group" "private-1a" {
        vpc_id = "${aws_vpc.default.id}"
        description = "SG for private instances"
        name = "PRIVATE SG"
        tags    {
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
#------------------------------------------------------------#
		#FINISH:-  RAVI KASHYAP#
#------------------------------------------------------------#
