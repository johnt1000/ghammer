# encoding: UTF-8

class Query
	attr_accessor :cmd
	attr_accessor :result
  attr_accessor :proxy

	def initialize(url, options = {})
		cmd = Curl::Easy.new(url)
    cmd.headers["User-Agent"] = Agent.new().to_s
    cmd.headers["Referer"] = Referer.new().to_s
    # TODO colocar em arquivo de configuração o valor padrão
    cmd.verbose = options.fetch(:verbose, false)
    self.cmd = cmd
    
    self.proxy = options.fetch(:proxy, false)
	end

	def run
    # TODO colocar em arquivo de configuração o valor padrão
    sleep 1.5
    if self.proxy == true
      p = Proxy.new()
      self.cmd.proxy_url = p.hostname
      self.cmd.proxy_type = Curl::CURLPROXY_SOCKS5
      self.cmd.proxy_tunnel = true
      self.cmd.ssl_verify_peer = false
      self.cmd.ssl_verify_host = false
      self.cmd.proxy_port = p.port.to_i
    end
		self.cmd.perform
	end

  def status
    self.cmd.status
  end

	def result
		self.cmd.body_str
	end
end