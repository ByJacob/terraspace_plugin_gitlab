module TerraspacePluginGitlab::Interfaces
  class Layer
    extend Memoist

    # interface method
    def namespace
      "projects"
    end

    # interface method
    def region
      ENV['GITLAB_PROJECT_ID']
    end

    def provider
      "gitlab"
    end

  end
end
