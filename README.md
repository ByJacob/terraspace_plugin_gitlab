# Terraspace Gitlab Backend Plugin

Gitlab Backend support for [terraspace](https://terraspace.cloud/). The module only provides the `http` backend for Gitlab.

More about terraform state you can find in [Official documentation](https://docs.gitlab.com/ee/user/infrastructure/iac/terraform_state.html)

## Installation

Add this line to your application's Gemfile (check latest tag in repository):

```ruby
gem 'terraspace_plugin_gitlab', git: 'https://github.com/ByJacob/terraspace_plugin_gitlab', tag: '0.0.1'
```

Copy backend provider:

```hcl
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

```

You must configure special system enviroment (or add it to `boot.rb` file):

|Name|Description|
|---|---|
|`GITLAB_USERNAME`| Your Gitlab username|
|`GITLAB_ACCESS_TOKEN`| Gitlab personal access tokens with `api` scope |
|`GITLAB_URL`| Gitlab url without protocol, example: `gitlab.com` |
|`GITLAB_PROJECT_ID`| Project ID from Gitlab where store terraform state, example: `123` |

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ByJacob/terraspace_plugin_gitlab.
