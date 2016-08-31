# encoding: UTF-8

class Search
	attr_accessor :site
	attr_accessor :domain
	attr_accessor :dork
	attr_accessor :num_result

	def initialize(site)
		self.site = site
		self.domain = Domain.new
		self.num_result = 1500
	end

	def uri_dork
		unless dork.nil?
			str = "site:#{self.site} #{self.dork}".gsub(' ', '+')
			URI.escape(str)
		end
	end

	def run
		# agent / referer
		#agent = Agent.new
    #referer = Referer.new

		#curl = Curl::Easy.new(self.to_s)
    #curl.headers["User-Agent"] = agent.to_s
    #curl.headers["Referer"] = referer.to_s
    # curl.verbose = true
    #curl.perform

    q = Query.new(self.to_s)
    q.run
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
		"#{self.domain}/search?q=#{self.uri_dork}&num=#{self.num_result}btnG=Search&pws=1"
	end
end