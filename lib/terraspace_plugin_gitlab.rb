lib = File.expand_path("../../../", __FILE__)
$:.unshift(lib)

require "memoist"
require "terraspace" # for interface

require "terraspace_plugin_gitlab/version"
require "terraspace_plugin_gitlab/autoloader"
TerraspacePluginGitlab::Autoloader.setup

module TerraspacePluginGitlab
  class Error < StandardError; end

  # Friendlier method for config/plugins/gitlab.rb. Example:
  #
  #     TerraspacePluginGitlab.configure do |config|
  #       config.resource.property = "value"
  #     end
  #
  def configure(&block)
    Interfaces::Config.instance.configure(&block)
  end

  def config
    Interfaces::Config.instance.config
  end

  extend self
end
puts "Load gitlab module"
Terraspace::Plugin.register("Gitlab",
  backend: "http",
  config_class: TerraspacePluginGitlab::Interfaces::Config,
  layer_class: TerraspacePluginGitlab::Interfaces::Layer,
  root: File.dirname(__dir__),
)
