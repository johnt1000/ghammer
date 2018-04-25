# encoding: UTF-8
require File.join(File.dirname(__FILE__), "config")

class Proxy
  attr_reader :hostname, :port, :env, :name

  def initialize(options = {})
    @env = options.fetch(:env, 'production')
    config = Config.new({env: @env})
    @hostname = options.fetch(:hostname, config.yml['proxy']['hostname'])
    @port = options.fetch(:port, config.yml['proxy']['port'])
    @name = options.fetch(:port, config.yml['proxy']['name'])
  end

  # TODO Test
  def running?
    Tool.new().tor_running?
  end
  
  # TODO Test
  def renew
    Tool.new().tor_renew
  end

  def to_s
    "#{@hostname}:#{@port}"
  end
end