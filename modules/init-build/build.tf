resource "null_resource" "build" {
#creatin triger  start null resouce
  triggers = {
    values = var.image_tag
  }
#  simple bash script to  push image to ECR 
  provisioner "local-exec" {
    command = "./build.sh  >last_build.log"
    working_dir = var.working_dir
  
    environment = {
        tag = var.image_tag
        reg_id = var.ecr_repository_url            
    
     }
}
}

