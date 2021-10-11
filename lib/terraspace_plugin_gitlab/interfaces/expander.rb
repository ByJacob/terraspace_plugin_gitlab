# This is where you define variable substitions for the Terraspace expander.
# Methods are available as variables.  For example:
#
#    variable | method
#    ---------|--------
#    :ACCOUNT | account
#    :REGION  | region
#
module TerraspacePluginGitlab::Interfaces
  class Expander
    include Terraspace::Plugin::Expander::Interface

    delegate :region, to: :mod

    def username
      ENV['GITLAB_USERNAME']
    end

    def access_token
      ENV['GITLAB_ACCESS_TOKEN']
    end

    def project_id
      ENV['GITLAB_PROJECT_ID']
    end
    alias_method :project, :project_id
    alias_method :region, :project_id

    def url
      ENV['GITLAB_URL'] 
    end

    def state_name
      "env" + Terraspace.env.titleize  + "_type" + @mod.type.titleize  + "_mod" + @mod.name.titleize 
    end

  end

end

puts "Load my expander"