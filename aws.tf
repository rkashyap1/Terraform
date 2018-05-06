provider	"aws" 	{
	access_key = "${var.aws_access_key}"
	secret_key = "${var.aws_secret_key}"
	region = "${var.aws_region}"
	}

#provider "aws" {

#	assume_role {
#	  	role_arn = "arn:aws:iam::895959828379:user/Ravi"
#	}	
#	region = "${var.aws_region}"
#}
