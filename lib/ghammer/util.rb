# encoding: UTF-8
require "yaml"

class Util
  attr_reader :yml

  def load_config_yml file
    if File.exist? file.to_s
      @yml = YAML.load_file(file.to_s)
    end
  end
end