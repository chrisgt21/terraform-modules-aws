module lambda {
    source = "./modules/lambda"

    function_name = var.function_name
    bucket = var.bucket
    object = var.key
    description = "test description"
    handler = "app.handler"
    runtime = "python3.7"
    memory = "128"
    provisioned_concurrency = "5"
    timeout = "20"
    publish = false
    kms = null


    environment = {
        Environment = "test"
    }

    tags = {
        Environment = "test"
    }
}