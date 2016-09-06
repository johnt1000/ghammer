# encoding: UTF-8

class Query
	attr_accessor :cmd
	attr_accessor :result
  attr_accessor :delay
  attr_accessor :verbose
  # proxy
  attr_accessor :proxy
  attr_accessor :proxy_use
  attr_accessor :proxy_hostname
  attr_accessor :proxy_port

	def initialize(url, options = {})
		self.cmd = Curl::Easy.new(url)
    self.cmd.headers["User-Agent"] = Agent.new().to_s
    self.cmd.headers["Referer"] = Referer.new().to_s

    self.verbose = options.fetch(:verbose, false)
    self.delay = options.fetch(:delay, 1.5)
    
    self.proxy_use = options.fetch(:proxy_use, false)
    self.proxy_hostname = options.fetch(:proxy_hostname, nil)
    self.proxy_port = options.fetch(:proxy_port, nil)
    self.proxy = Proxy.new({ hostname: self.proxy_hostname, port: self.proxy_port })
	end

	def run
    sleep self.delay
    if self.proxy_use == true
      self.cmd.proxy_url = self.proxy.hostname
      self.cmd.proxy_type = Curl::CURLPROXY_SOCKS5
      self.cmd.proxy_tunnel = true
      self.cmd.ssl_verify_peer = false
      self.cmd.ssl_verify_host = false
      self.cmd.proxy_port = self.proxy.port
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