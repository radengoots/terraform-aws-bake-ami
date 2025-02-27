variable "service_name" {
  type        = "string"
  description = "the name of the service"
}

variable "product_domain" {
  type        = "string"
  description = "the owner of this pipeline (e.g. team). This is used mostly for adding tags to resources"
}

variable "base_ami_owners" {
  type        = "list"
  description = "the owners (AWS account IDs) of the base AMIs that instances will be run from"
}

variable "buildspec" {
  type        = "string"
  description = "the buildspec for the CodeBuild project"
}

variable "playbook_bucket" {
  type        = "string"
  description = "the S3 bucket that contains the AMI baking playbook"
}

variable "ami_manifest_bucket" {
  type        = "string"
  description = "the S3 bucket to which CodeBuild will store the resulting AMI's artifacts"
}

variable "playbook_key" {
  type        = "string"
  description = "the S3 key of the AMI baking playbook that will be used as the pipeline input. CodeBuild doesn't seem to support tar files"
}

variable "vpc_id" {
  type        = "string"
  description = "the id of the VPC where AMI baking instances will reside on"
}

variable "subnet_id" {
  type        = "string"
  description = "the id of the subnet where AMI baking instances will reside on"
}

variable "bake_codebuild_compute_type" {
  type        = "string"
  description = "https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html"
  default     = "BUILD_GENERAL1_SMALL"
}

variable "bake_codebuild_image" {
  type        = "string"
  description = "https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-available.html"
  default     = "traveloka/codebuild-ami-baking:latest"
}

variable "bake_codebuild_image_credentials" {
  type        = "string"
  default     = "CODEBUILD"
  description = "Credentials to be used to pull codebuild environment image"
}

variable "bake_codebuild_environment_type" {
  type        = "string"
  description = "https://docs.aws.amazon.com/codebuild/latest/userguide/create-project.html#create-project-cli"
  default     = "LINUX_CONTAINER"
}

variable "codepipeline_artifact_bucket" {
  type        = "string"
  description = "An S3 bucket to be used as CodePipeline's artifact bucket"
}

variable "codebuild_cache_bucket" {
  type        = "string"
  description = "An S3 bucket to be used as CodeBuild's cache bucket"

  # default to no cache
  default = ""
}

variable "template_instance_profile" {
  type        = "string"
  description = "The name of the instance profile with which AMI baking instances will run"
}

variable "template_instance_sg" {
  type        = "string"
  description = "The id of the security group with which AMI baking instances will run"
}

variable "codebuild_role_arn" {
  type        = "string"
  description = "The role arn to be assumed by the codebuild project"
}

variable "codepipeline_role_arn" {
  type        = "string"
  description = "The role arn to be assumed by the codepipeline"
}

variable "lambda_function_name" {
  type        = "string"
  description = "The name of the AMI sharing lambda function"
}

variable "events_role_arn" {
  type        = "string"
  description = "The role arn to be assumed by the cloudwatch events rule"
}

variable "slack_channel" {
  type        = "string"
  default     = ""
  description = "The name of the slack channel to which baked AMI IDs will be sent"
}

variable "codepipeline_poll_for_source_changes" {
  type        = "string"
  description = "Whether or not the pipeline should poll for source changes"
  default     = "false"
}
