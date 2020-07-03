# terraform-modules-aws
This project will demonstrate how to structure your Terraform modules so that they are portable. 

## Lambda
### Variables
* function_name (string) - name of the lambda function
* bucket (string) - name of the S3 bucket with the deployment package
* key (string) - name of the deployment package in S3

### Usage
Run the following commands to test the module:
```
terraform init
terraform plan -var function_name=FUNCTION_NAME -var bucket=S3_BUCKET -var key=S3_KEY
terraform apply -var function_name=FUNCTION_NAME -var bucket=S3_BUCKET -var key=S3_KEY
```
