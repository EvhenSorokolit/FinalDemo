terraform {
  source = "../../../modules//init-build"
}

include {
  path = find_in_parent_folders()
}

dependency "ecr" {
  config_path = "../ecr"
  mock_outputs = {
      ecr_repository_url = "000000000000.dkr.ecr.eu-west-1.amazonaws.com/image"
  }
  
}

locals {
  secrets = read_terragrunt_config(find_in_parent_folders("secrets.hcl"))
}

inputs = merge(
  local.secrets.inputs,{
  ecr_repository_url = dependency.ecr.outputs.ecr_repository_url
  working_dir = format("%s/../../../app", get_terragrunt_dir())
})