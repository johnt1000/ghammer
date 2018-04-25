# encoding: UTF-8
require File.join(File.dirname(__FILE__), '..', 'config')
require File.join(File.dirname(__FILE__), '..', 'proxy', 'tor')

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
    Tor::running?
  end
  
  # TODO Test
  def renew
    Tor::renew
  end

  def to_s
    "#{@hostname}:#{@port}"
  end
end