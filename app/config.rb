# encoding: UTF-8

class Config
  attr_reader :env, :yml

  def initialize(options = {})
    @env = options.fetch(:env, ENV['ENV'])
		@yml = YAML.load_file(File.join(File.dirname(__FILE__), '..', 'config', "#{@env}.yml"))
  end
end