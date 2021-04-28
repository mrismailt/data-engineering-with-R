# data-engineering-with-R

## Useful links

- https://github.com/mrismailt/r-shiny-aws-ec2-docker-cheatsheet

- https://vsupalov.com/docker-arg-env-variable-guide/#:~:text=env%20file%2C%20is%20only%20used,yml%20files.&text=env%E2%80%9D%20named%20file%20in%20the,it%20(ENTRYPOINT%2C%20CMD)

- https://linux.die.net/man/1/rscript

- http://datacornering.com/how-to-run-r-script-from-another-r-script-and-use-as-a-source/

## Run

`docker run --rm -dit -e script_name=example.R dockerimage`

## What I did to get load files from Google drive to aws

create service account. download json. get email for service account. grant permission to that email in google drive. then:

googledrive::drive_deauth()
googledrive::drive_auth(path = "/code/json.json")

path <- paste(getwd(), "master_file.xlsx", sep = "/")

googledrive::drive_download(
file = googledrive::as_id("1gkN9ZVQf_7KHGzKdh7lEjSW9ulxEZ57x"),
  path = path
)
