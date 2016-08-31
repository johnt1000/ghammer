# encoding: UTF-8

class Query
	attr_accessor :cmd
	attr_accessor :result

	def initialize(url, proxy = false)
		#c = Curl::Easy.new(self.to_s)
		#c.headers["User-Agent"] = Agent.new().to_s
    #c.headers["Referer"] = Referer.new().to_s
    #c.verbose = true

    #if proxy == true
    #	p = Proxy.new()
    #	c.proxy_url = p.hostname.to_s
    #	c.proxy_type = Curl::CURLPROXY_SOCKS5
    #	c.proxy_port = p.port.to_i
  	#end

  	cmd = '/usr/bin/curl'
  	cmd.concat " --user-agent \"#{Agent.new().to_s}\" --referer #{Referer.new().to_s}"
  	cmd.concat " --socks5 #{Proxy.new().to_s}" if proxy == true
  	cmd.concat " #{url} > "

		self.cmd = cmd
	end

	def run
		#self.curl.perform
		stdop = system(self.cmd)
    result = $?
    puts "+++++++++++++++++"
    puts stdop
    puts "+++++++++++++++++"
	end

	def result
		#self.curl.body_str
		self.result
	end

	def to_s
		cmd
	end
end