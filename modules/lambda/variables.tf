variable "function_name" {
    type = string
    description = "Name of the Lambda function."
}

variable "bucket" {
    type = string
    description = "Name of the S3 bucket that contains the deployment package."
}

variable "object" {
    type = string
    description = "Filename of the deployment package S3 object."
}

variable "handler" {
    type = string
    description = "Lambda function handler."
}

variable "description" {
    type = string
    description = "Description of the lambda function."
}

variable "memory" {
    type = string
    description = "Memory size for the lambda function."
}

variable "runtime" {
    type = string
    description = "Runtime for the lambda function."
}

variable "timeout" {
    type = string
    description = "Timeout for the lambda function."
}

variable "provisioned_concurrency" {
    type = string
    description = "Provision concurrency for the lambda function."
}

variable "publish" {
    type = bool
    description = "Publish configuration for lambda function."
}

variable "environment" {
    type = map(string)
    description = "Environment variables for lambda function."
}

variable "kms" {
    type = string
    description = "(Optional) KMS key ARN to specify for lambda function environment variables."
}

variable "tags" {
    type = "map"

}

variable "vpc_config" {
  default     = null
  description = "Provide this to allow your function to access your VPC. Fields documented below. See Lambda in VPC."
  type = object({
    security_group_ids = list(string)
    subnet_ids         = list(string)
  })
}

variable "xray" {
  default     = null
  description = "Use AWS X-Ray to collect data about events that your function processes, and to identify the cause of errors in your serverless applications. Can be either PassThrough or Active."
  type = object({
    mode = string
  })
}

