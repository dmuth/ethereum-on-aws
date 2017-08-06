

#
# This file hodls all of our variables.
#

variable "amis" {

	type = "map"

	default = {
		#us-east-1	= "ami-a4c7edb2" # AWS Linux
		us-east-1	= "ami-d15a75c7" # Ubuntu 16.04
	}
}


