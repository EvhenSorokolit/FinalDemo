
variable "aws_region" {}
variable "aws_profile" {} 

variable "image_tag" {
    description = " Enter name"
    default = "latest"
    
}
variable "ecr_repository_url" {
    description = " Enter reg id url"
    
    
    
}

variable "working_dir" {
    description = " Enter workdir"
    default = ".//app"
    
}

#SSM
variable "db_pass"{
    default = "test1324678"
}

variable "token"{
    
}

variable "api_key"{
    
}
variable "name" {
    description = " Enter name"
    default = "test"
    
}
variable "env"{
    description = " Enter env"
    default = "prod"
}
