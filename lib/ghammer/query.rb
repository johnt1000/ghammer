# encoding: UTF-8

class Query
  attr_accessor :cmd
  attr_accessor :delay
  attr_accessor :verbose
  # proxy
  attr_accessor :proxy_use
  attr_accessor :proxy

  def initialize(url, options = {})
    self.cmd = Curl::Easy.new(url)
    self.cmd.headers["User-Agent"] = Agent.new().to_s
    self.cmd.headers["Referer"] = Referer.new().to_s

    self.verbose = options.fetch(:verbose, CONFIG.query_verbose)
    self.delay = options.fetch(:delay, CONFIG.query_delay)
    
    self.proxy_use = options.fetch(:proxy_use, CONFIG.proxy_use)
    self.proxy = Proxy.new
  end

  def run
    sleep self.delay
    if self.proxy_use == true
      # proxy configuration
      self.cmd.proxy_url = self.proxy.hostname
      self.cmd.proxy_port = self.proxy.port
      self.cmd.proxy_type = Curl::CURLPROXY_SOCKS5
      self.cmd.proxy_tunnel = true
      self.cmd.ssl_verify_peer = false
      self.cmd.ssl_verify_host = false
    end
    self.cmd.verbose = self.verbose
    self.cmd.perform
  end

  def status
    self.cmd.status
  end

  def result
    self.cmd.body_str
  end
end