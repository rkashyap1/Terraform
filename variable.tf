variable aws_access_key {}
variable aws_secret_key {}

variable "aws_region" {
	description = 	"	region name"
	}
	  

#-----------------------------------------------------------------#
#		           AMI ID   			    	  #
#-----------------------------------------------------------------#
variable "AMI_Name" {
	description = "			What is AMI ID" 
	}

#-----------------------------------------------------------------#
#		PUBLIC SUBNET NAME FOR "1A &1B " ZONE             #
#-----------------------------------------------------------------#
variable "Public_subnet1a_Name" {
	description = "			PUBLIC SUBNET NAME 1A ZONE"
	}



#PUBLIC SUBNET NAME FOR "1B" ZONE
variable "Public_subnet1b_Name" {
	description = "			PUBLIC SUBNET NAME 1B ZONE"
	}

#-----------------------------------------------------------------#
#		PRIVATE SUBNET NAME FOR "1A &1B" ZONE             #
#-----------------------------------------------------------------#

#PRIVATE SUBNET NAME FOR "1A" ZONE
variable "Private1A_Name" {
        description = "			PRIVATE SUBNET NAME 1A ZONE"
        }


#PRIVATE SUBNET NAME FOR "1B" ZONE
variable "Private1B_Name" {
        description = "PRIVATE SUBNET NAME 1B ZONE"
        }

#-----------------------------------------------------------------#
#		        CIDR PUBLIC SUBNET			  #
#-----------------------------------------------------------------#
#CIDR FOR PUBLIC SUBNET 1A ZONE
variable "Public_subnet1a_CIDR" {
	description = "			Public Subnet CIDR 1A ZONE"
	}


#CIDR FOR PUBLIC SUBNET 1B ZONE
variable "Public_subnet1b_CIDR" {
	description = "			Public Subnet CIDR 1B ZONE" 
	}

#-----------------------------------------------------------------#
#		        CIDR PRIVATE SUBNET			  #
#-----------------------------------------------------------------#
#CIDR FOR PRIVATE SUBNET 1A ZONE
variable "Private_subnet1a_CIDR" {
	description = "			Private Subnet CIDR 1A ZONE" 
	}

#CIDR FOR PRIVATE SUBNET 1B ZONE
variable "Private_subnet1b_CIDR" {
	description = "			Private Subnet CIDR 1B ZONE" 
	}

#-----------------------------------------------------------------#
#			AZ for private1A                          #
#-----------------------------------------------------------------#
variable "private1a_az" {
	description = "			AZ for Private1A subnet"
	}

#-----------------------------------------------------------------#
#			 AZ for private1B                         #
#-----------------------------------------------------------------#
variable  "private1b_az" {
	description = "			AZ for Private1A subnet"
	}

#-----------------------------------------------------------------#
#			VPC CIDR/NAME                             #
#-----------------------------------------------------------------#

#CIDR FOR VPC
variable "vpc_cidr" {
	description = "			CIDR FOR THE WHOLE VPC"
	}

variable "vpc_name" {
	description = " 	PLEASE PROVIDE THE VPC NAME"
	}
#-----------------------------------------------------------------#
#			"ELB NAME" 				  #
#-----------------------------------------------------------------#
variable "ELB_name" {
	description = "		ELB NAME"
	}
#-----------------------------------------------------------------#
#			"INSTANCE TYPE"                           #
#-----------------------------------------------------------------#
variable "INS_type" {
	description = "PLEASE PROVIDE THE INSTANCE TYPE"
	}

#-----------------------------------------------------------------#
#			"INSTANCE TYPE"                           #
#-----------------------------------------------------------------#
variable "key_name" {
	description = "		KEY NAME"
		}
#-----------------------------------------------------------------#
#                        SECURITY GROUP				  #
#-----------------------------------------------------------------#
variable "SG_name" {
	description = "ENTER THE SECURITY GROUP NAME"
	}
#-----------------------------------------------------------------#
#-----------------------------------------------------------------#
