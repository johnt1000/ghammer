class Dork
	
	attr_accessor :title
	attr_accessor :description
	attr_accessor :category
	attr_accessor :author
	attr_accessor :version
	attr_accessor :deprecated
	attr_accessor :dork

	def initialized
		self.title = nil
		self.description = nil
		self.category = nil
		self.author = nil
		self.version = 0
		self.deprecated = false
		self.dork = []
	end
end