class Expr
	attr_accessor :type
	attr_accessor :value
	attr_accessor :quoted
	attr_accessor :suppress
	attr_accessor :synonyms

	def initialize
		self.quoted = false
	end
end