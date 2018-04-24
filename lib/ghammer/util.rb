# encoding: UTF-8
require "yaml"

class Util
  attr_reader :config

  def load_config_yml file
    if File.exist? file.to_s
      @config = YAML.load_file(file.to_s)
    end
  end
end