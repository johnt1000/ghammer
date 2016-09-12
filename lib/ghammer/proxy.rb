# encoding: UTF-8

class Proxy
  attr_accessor :hostname
  attr_accessor :port

  def initialize(options = {})
    self.hostname = options.fetch(:hostname, CONFIG.proxy_hostname)
    self.port = options.fetch(:port, CONFIG.proxy_port)
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
    "#{self.hostname}:#{self.port}"
  end
end