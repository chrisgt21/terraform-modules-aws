# terraform-modules-aws
This project will demonstrate how to structure your Terraform modules so that they are portable. 

## Lambda
### Variables

### Usage
Run the following commands to test the module:
```
terraform init
terraform plan -var function_name=FUNCTION_NAME -var bucket=S3_BUCKET -var key=S3_KEY
terraform apply -var function_name=FUNCTION_NAME -var bucket=S3_BUCKET -var key=S3_KEY
```
