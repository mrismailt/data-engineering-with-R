Sys.setenv("AWS_ACCESS_KEY_ID" = "",
           "AWS_SECRET_ACCESS_KEY" = "",
           "AWS_DEFAULT_REGION" = "us-east-2")

args <- commandArgs(trailingOnly = TRUE)

script_name <- tail(args, n = 1)

script <- paste("s3://collective-contract-etl-scripts", script_name, sep = "/")

if(suppressMessages(aws.s3::object_exists(script))) {
  aws.s3::save_object(script)
  
  tryCatch(
    system(paste("Rscript", paste(getwd(), script_name, sep = "/"))),
    error = function(e) paste(script_name, "Failed to run. Gave the following error message:", e),
    finally = print("get_script.R completed")
  )
} else print(paste(script_name, "not found"))