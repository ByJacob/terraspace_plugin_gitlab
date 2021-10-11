# https://docs.gitlab.com/ee/user/infrastructure/iac/terraform_state.html
terraform {
  backend "http" {
    address = "<%= expansion('https://:URL/api/v4/projects/:PROJECT_ID/terraform/state/:STATE_NAME') %>"
    lock_address = "<%= expansion('https://:URL/api/v4/projects/:PROJECT_ID/terraform/state/:STATE_NAME/lock') %>"
    unlock_address = "<%= expansion('https://:URL/api/v4/projects/:PROJECT_ID/terraform/state/:STATE_NAME/lock') %>"
    username = "<%= expansion(':USERNAME') %>"
    password = "<%= expansion(':ACCESS_TOKEN') %>"
    lock_method = "POST"
    unlock_method = "DELETE"
    retry_wait_min = 5
  }
}
