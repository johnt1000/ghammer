# encoding: UTF-8
require File.join(File.dirname(__FILE__), "util")

class Config < Util
  attr_reader :env, :path

  def initialize(options = {})
    @env = options.fetch(:env, nil)
    @path = options.fetch(:path, '')
		load_config_yml @path.to_s
  end
end