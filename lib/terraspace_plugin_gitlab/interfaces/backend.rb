module TerraspacePluginGitlab::Interfaces
  class Backend
    include Terraspace::Plugin::Backend::Interface
    include TerraspacePluginGitlab::Clients

    # interface method
    def call
      # @info hash is available from the interface module
      # It contains the backend struture.
    end
  end
end
