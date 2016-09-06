# encoding: UTF-8

class Proxy
	attr_accessor :hostname
	attr_accessor :port
	attr_accessor :status

	def initialize(options = {})
    self.hostname = options.fetch(:hostname, nil)
    self.port = options.fetch(:port, nil)
    self.status = Tool.new().tor_running?
	end

	def to_s
		"#{self.hostname}:#{self.port}"
	end
end