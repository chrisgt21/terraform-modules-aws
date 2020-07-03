resource "aws_lambda_function" "function"{
    function_name = "${var.function_name}"
    s3_bucket = "${var.bucket}"
    s3_key = "${var.object}"
    handler = "${var.handler}"
    description = "${var.description}"
    memory_size = "${var.memory}"
    runtime = "${var.runtime}"
    timeout = "${var.timeout}"
    reserved_concurrent_executions = "${var.provisioned_concurrency}"
    publish = "${var.publish}"
    kms_key_arn = "${var.kms}"
    tags = "${var.tags}"
    #file_system_config = "${var.efs}""
    #dead_letter_config = "${var.dead_letter}""
    role = "${aws_iam_role.role.arn}"
    
    dynamic "vpc_config" {
        for_each = var.vpc_config == null ? [] : [var.vpc_config]
        content {
            security_group_ids = vpc_config.value.security_group_ids
            subnet_ids         = vpc_config.value.subnet_ids
        }
    }

    dynamic "tracing_config" {
        for_each = var.xray == null ? [] : [var.xray]
        content {
            mode = xray.value.mode
        }
    }

    dynamic "environment" {
        for_each = var.environment == null ? [] : [var.environment]
        content {
            variables = var.environment
        }
    }
}


resource "aws_iam_role" "role" {
    name = "Lambda-${var.function_name}-Role"
    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "lambda.amazonaws.com"
            },
            "Effect": "Allow"
        }
    ]
}
EOF
}