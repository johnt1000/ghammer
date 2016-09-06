# encoding: UTF-8

class Search
  # search
	attr_accessor :target
	attr_accessor :domain
	attr_accessor :dork
  attr_accessor :num_result
  # proxy
  attr_accessor :proxy_use
  attr_accessor :proxy_hostname
  attr_accessor :proxy_port
  # query
  attr_accessor :query
  # results
	attr_accessor :output_directory

	def initialize(target, options = {})
		#search
    self.target = target
		self.domain = Domain.new
    self.num_result = options.fetch(:num_result, nil)
    # proxy
    self.proxy_use = options.fetch(:proxy_use, false)
    self.proxy_hostname = options.fetch(:proxy_hostname, nil)
    self.proxy_port = options.fetch(:proxy_port, nil)
		# results
		self.output_directory = options.fetch(:output_directory, nil)
	end

	def run
    self.query = Query.new(self.to_s)
    self.query.proxy_use = self.proxy_use
    self.query.proxy_hostname = self.proxy_hostname
    self.query.proxy_port = self.proxy_port
    self.query.run
	end

	def save
		Dir.mkdir(self.output_directory, 0700) unless Dir.exist?(self.output_directory)

		output = File.open( "#{self.output_directory}/#{self.dork.md5}.html","w" )
    output << self.query.result
    output.close
	end

	def success?
    if self.query.status == "200 OK"
    	true
    else
    	false
    end
	end

	def uri
		uri = URI.escape("site:#{self.target}")
		"#{uri}+#{self.dork.uri}"
	end

	def to_s
		"#{self.domain}/search?q=#{self.uri}&num=#{self.num_result}btnG=Search&pws=1"
	end
end