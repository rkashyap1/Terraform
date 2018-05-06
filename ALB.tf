resource aws_alb "DEMO" {
	name = "DEMO-alb"
	internal = "false" 
	load_balancer_type = "application"
	subnets = ["${aws_subnet.Public-1a.id}", "${aws_subnet.Public-1b.id}" ]
	security_groups = ["${aws_security_group.private-1a.id}"]
	tags	{
		name = "DEMO"
		}
	}

resource "aws_alb_listener" "alb_listener" {
	load_balancer_arn = "${aws_alb.DEMO.arn}"
	port = "80"
	protocol = "HTTP"
	default_action {
		target_group_arn = "${aws_alb_target_group.DEMO.id}"
		type             = "forward"  
		}
	}
	
resource "aws_alb_target_group" "DEMO" {
	name = "test"
	port = "80"
	protocol = "HTTP"
	vpc_id = "${aws_vpc.default.id}"
	health_check {    
   		healthy_threshold   = 3    
    		unhealthy_threshold = 10    
    		timeout             = 5    
    		interval            = 10    
    		path                = "/"    
    		port                = "80"  
		  }
	}

resource "aws_alb_target_group_attachment" "default1" {
	target_id = "${aws_instance.WEB1.id}"
	target_group_arn = "${aws_alb_target_group.DEMO.id}"
	port = "80"
	}

resource "aws_alb_target_group_attachment" "default2" {
	target_id = "${aws_instance.WEB2.id}"
	target_group_arn = "${aws_alb_target_group.DEMO.id}"
	port = "80"
	}
#--------------------------------------------------#
                #1A- AVAILABILITY ZONE#
#--------------------------------------------------#

resource "aws_instance" "WEB1" {
  ami = "${var.AMI_Name}"
  instance_type = "${var.INS_type}"
  subnet_id = "${aws_subnet.Private-1a.id}"
  key_name = "${var.key_name}"
  availability_zone = "${var.private1a_az}"
  security_groups = ["${aws_security_group.private-1a.id}"]

  user_data = <<-EOF
  #!/bin/bash
  echo "Hello, World" > index.html
  nohup busybox httpd -f -p 80 &
  EOF
}

#--------------------------------------------------#
                #1B- AVAILABILITY ZONE#
#--------------------------------------------------#

resource "aws_instance" "WEB2" {
  ami = "${var.AMI_Name}"
  instance_type = "${var.INS_type}"
  subnet_id = "${aws_subnet.Private-1b.id}"
  key_name = "${var.key_name}"
  availability_zone = "${var.private1b_az}"
  security_groups = ["${aws_security_group.private-1a.id}"]

  user_data = <<-EOF
  #!/bin/bash
  echo "Hello, World" > index.html
  nohup busybox httpd -f -p 80 &
  EOF
}

#--------------------------------------------------#
#		       FINISH	                   #
#--------------------------------------------------#
