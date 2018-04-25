# encoding: UTF-8
require File.join(File.dirname(__FILE__), "util")

class Config < Util
  attr_reader :env, :path

  def initialize(options = {})
    @env = options.fetch(:env, 'production')
    @path = options.fetch(:path, File.join(File.dirname(__FILE__), '..', '..', 'config', "#{@env.to_s}.yml"))
		load_config_yml @path.to_s
  end
end