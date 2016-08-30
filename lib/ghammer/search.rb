require 'uri'

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

	def to_s
		"#{self.domain}/search?q=#{self.uri_dork}&num=#{self.num_result}btnG=Search&pws=1"
	end
end