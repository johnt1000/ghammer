class Dork
	
	attr_accessor :title
	attr_accessor :description
	attr_accessor :category
	attr_accessor :author
	attr_accessor :version
	attr_accessor :dork

	def initialized
		@title = nil
		@description = nil
		@category = nil
		@author = nil
		@version = nil
		@dork = []
	end
end