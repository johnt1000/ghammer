# encoding: UTF-8

class Query
	attr_accessor :cmd
	attr_accessor :result
  attr_accessor :proxy

	def initialize(url, options = {})
		cmd = Curl::Easy.new(url)
    cmd.headers["User-Agent"] = Agent.new().to_s
    cmd.headers["Referer"] = Referer.new().to_s
    # cmd.verbose = true
    self.cmd = cmd
    
    self.proxy = options.fetch(:proxy, false)
	end

	def run
    if self.proxy == true
      p = Proxy.new()
      self.cmd.proxy_url = p.hostname
      self.cmd.proxy_type = Curl::CURLPROXY_SOCKS5
      self.cmd.proxy_tunnel = true
      self.cmd.proxy_port = p.port.to_i
    end
		self.cmd.perform
	end

	def result
    self.run
		self.cmd.body_str
	end
end