# encoding: UTF-8

class Search
	attr_accessor :site
	attr_accessor :domain
	attr_accessor :dork
  attr_accessor :proxy
	attr_accessor :num_result

	def initialize(site, options = {})
    self.proxy = options.fetch(:proxy, false)
     
		self.site = site
		self.domain = Domain.new
		self.num_result = 1500
	end

	def uri
		uri = URI.escape("site:#{self.site}")
		"#{uri}+#{self.dork.uri}"
	end

	def run
    q = Query.new(self.to_s, { proxy: self.proxy })
    self.save_result(q.result)
	end

	def save_result(rs)
		dir_output = File.join(Dir.home, ".output")
		Dir.mkdir(dir_output, 0700) unless File.exists?(dir_output)
		output = File.open( "#{self.dork.md5}.html","w" )
    output << rs
    output.close
	end

	def to_s
		"#{self.domain}/search?q=#{self.uri}&num=#{self.num_result}btnG=Search&pws=1"
	end
end