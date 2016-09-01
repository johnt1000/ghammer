# encoding: UTF-8

class Search
	attr_accessor :site
	attr_accessor :domain
	attr_accessor :dork
  attr_accessor :proxy
	attr_accessor :num_result
	attr_accessor :query

	def initialize(site, options = {})
    self.proxy = options.fetch(:proxy, false)
		self.site = site
		self.domain = Domain.new
		# TODO colocar em arquivo de configuração o valor padrão
		self.num_result = 1500
	end

	def run
    self.query = Query.new(self.to_s, { proxy: self.proxy })
    self.query.run
	end

	def save(options = {})
		#dir_output = File.join(Dir.home, ".output")
		#Dir.mkdir(dir_output, 0700) unless File.exists?(dir_output)

		# TODO colocar em arquivo de configuração o valor padrão
		path = options.fetch(:path, '.')
		path.concat '/output/'

		output = File.open( "#{path}#{self.dork.md5}.html","w" )
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