terraform {
  source = "../../../modules//cluster"
}

include {
  path = find_in_parent_folders()
}

dependencies {
    paths = ["../init-build"]
}
dependency "ecr" {
    config_path = "../ecr"
    mock_outputs = {
      ecr_repository_url = "000000000000.dkr.ecr.eu-west-1.amazonaws.com/image"
      }
}

inputs = {
    # token = dependency.init-build.outputs.token 
    # api_key = dependency.init-build.outputs.api_key
    # db_pass = dependency.init-build.outputs.db_pass
    ecr_repository_url = dependency.ecr.outputs.ecr_repository_url
  }