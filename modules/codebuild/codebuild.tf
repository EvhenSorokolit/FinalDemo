resource "aws_codebuild_source_credential" "github" {
  server_type = "GITHUB"
  auth_type   = "PERSONAL_ACCESS_TOKEN"
  token       = var.github_token
}

resource "aws_codebuild_project" "project" {
 # depends_on = [null_resource.import_source_credentials]
  name = "${var.name}-${var.env}-project"
  #description = local.description
  build_timeout = "120"

    service_role = aws_iam_role.role_for_code_build.arn
  artifacts {
    type = "NO_ARTIFACTS"
}

  environment {
 
    compute_type = "BUILD_GENERAL1_SMALL" # 7 GB memory

    image = "aws/codebuild/amazonlinux2-x86_64-standard:3.0"
    type = "LINUX_CONTAINER"
    # The privileged flag must be set so that your project has the required Docker permissions
    privileged_mode = true

    environment_variable {
      name = "ECR_URL"
      value = var.ecr_url
    }
    environment_variable {
      name = "ENV"
      value = var.env
    }

  }

  source {
    buildspec = var.build_spec_file
    type = "GITHUB"
    location = var.repo_url
    git_clone_depth = 1
    report_build_status = "true"
  }

  # Removed due using cache from ECR
  # cache {
  #   type = "LOCAL"
  #   modes = ["LOCAL_DOCKER_LAYER_CACHE"]
  # }

  # https://docs.aws.amazon.com/codebuild/latest/userguide/vpc-support.html#enabling-vpc-access-in-projects
  # Access resources within our VPC
  // dynamic "vpc_config" {
  //   for_each = var.vpc_id == null ? [] : [var.vpc_id]
  //   content {
  //     vpc_id = var.vpc_id
  //     subnets = var.subnets
  //     security_group_ids = var.security_groups
  //   }
  // }
  vpc_config {
    vpc_id = var.vpc_id

    subnets = var.subnet_id

    security_group_ids = [aws_security_group.codebuild_sg.id]
  }
}


resource "aws_codebuild_webhook" "example" {
  project_name = aws_codebuild_project.project.name
  build_type   = "BUILD"
  filter_group {
    filter {
      type    = "EVENT"
      pattern = var.git_trigger_event
    }

    filter {
      type    = "HEAD_REF"
      pattern = var.branch_pattern
    }
  }
}
