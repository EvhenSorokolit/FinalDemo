terraform {
  source = "../../../modules//codebuild"
}

include {
  path = find_in_parent_folders()
}

# locals {
#   secrets = read_terragrunt_config(find_in_parent_folders("secrets.hcl"))
# }

dependency "ecr" {
  config_path = "../ecr"
  mock_outputs = {
      ecr_repository_url = "000000000000.dkr.ecr.eu-west-1.amazonaws.com/image"
  }
  
}


dependency "cluster" {
  config_path = "../cluster"
  mock_outputs = {
    vpc_id          = "vpc-000000000000"
    private_ids = ["subnet-00000000000", "subnet-111111111111"]
  }
}

inputs =  {
    ecr_url = dependency.ecr.outputs.ecr_repository_url
    vpc_id = dependency.cluster.outputs.vpc_id
    subnet_id = dependency.cluster.outputs.private_ids
    build_spec_file = "providers/dev/buildspec.yml"
  }
