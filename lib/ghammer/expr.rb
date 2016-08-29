class Expr
	attr_accessor :type
	attr_accessor :value
	attr_accessor :quoted
	attr_accessor :suppress
	attr_accessor :synonyms

	def initialize(options = {})
    self.type = options.fetch(:type, nil)
    self.value = options.fetch(:value, nil)
    self.quoted = options.fetch(:quoted, false)
    self.suppress = options.fetch(:suppress, nil)
    self.synonyms = options.fetch(:synonyms, nil)
	end
end