# encoding: UTF-8

class Search
	attr_accessor :site
	attr_accessor :domain
	attr_accessor :dork
  attr_accessor :proxy
	attr_accessor :num_result
	attr_accessor :query
	attr_accessor :output_directory

	def initialize(site, options = {})
    self.proxy = options.fetch(:proxy, false)
		self.site = site
		self.domain = Domain.new
		# TODO colocar em arquivo de configuração o valor padrão
		self.output_directory = options.fetch(:output_directory, 'output')
		self.num_result = 1500
	end

	def run
    self.query = Query.new(self.to_s, { proxy: self.proxy })
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
		uri = URI.escape("site:#{self.site}")
		"#{uri}+#{self.dork.uri}"
	end

	def to_s
		"#{self.domain}/search?q=#{self.uri}&num=#{self.num_result}btnG=Search&pws=1"
	end
end