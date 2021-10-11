# https://docs.gitlab.com/ee/user/infrastructure/iac/terraform_state.html
backend("http",
  address: "https://:URL/api/v4/projects/:PROJECT_ID/terraform/state/:STATE_NAME"
  lock_address: "https://:URL/api/v4/projects/:PROJECT_ID/terraform/state/:STATE_NAME/lock"
  unlock_address: "https://:URL/api/v4/projects/:PROJECT_ID/terraform/state/:STATE_NAME/lock"
  username: ":USERNAME"
  password: ":ACCESS_TOKEN"
  lock_method: "POST"
  unlock_method: "DELETE"
  retry_wait_min: 5
)
