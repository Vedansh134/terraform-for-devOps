#define variables
variable "ami" {
  description = "define variables"
  type        = string
  default     = "ami-0f559c3642608c138"
}

variable "instance_type" {
  description = "define type of instance"
  type = string
  # default = "t2.micro"
  validation {
    condition = var.instance_type == "t2.micro" || var.instance_type == "t3.micro"
    error_message = "Please provide a lower instance sizes, only t2 and t3 are allow"
  }
}

# variable "root_block_device" {
#   description = "about root block type"
#   type = number
#   default = 20
# }

# for a same block variable we define in a single block
# use object for combine same category of property
variable "ec2_root_block_config" {
  type = object({
    var_type = string
    var_size = number 
  })
  default = {
    var_type = "gp2"
    var_size = 15
  }
}

variable "additional_tags" {
  type = map(string) #expecting key=value format
  default = {}
}