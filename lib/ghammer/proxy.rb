# encoding: UTF-8

class Proxy
	attr_accessor :hostname
	attr_accessor :port
	attr_accessor :status

	def initialize(options = {})
		# TODO colocar em arquivo de configuração o valor padrão
    self.hostname = options.fetch(:hostname, 'http://localhost')
    self.port = options.fetch(:port, 9050)
    self.status = Tool.new().tor_running?
	end

	def to_s
		"#{self.hostname}:#{self.port}"
	end
end