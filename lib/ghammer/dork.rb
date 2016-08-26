class Dork
	
	attr_accessor :title
	attr_accessor :description
	attr_accessor :category
	attr_accessor :author
	attr_accessor :version
	attr_accessor :deprecated
	attr_accessor :expr

	def initialized
		self.title = nil
		self.description = nil
		self.category = nil
		self.author = nil
		self.version = 0
		self.deprecated = false
	end

	def add_expr(expr)
		if self.expr.nil?
			self.expr = Array.new
		end
		self.expr.push(expr)
	end

	def to_s
		
		str = String.new

		self.expr.each do |e|
			case e.type
			when 'text'
				str.concat(" #{e.value}") if e.quoted == false
				str.concat(" \"#{e.value}\"") if e.quoted == true
			when 'intitle'
				str.concat(" intitle:#{e.value}") if e.quoted == false
				str.concat(" intitle:\"#{e.value}\"") if e.quoted == true
			else
				str.concat(" #{e.value}") if e.quoted == false
				str.concat(" \"#{e.value}\"") if e.quoted == true
			end

			unless e.suppress.nil?
				str.concat(" -#{e.suppress}")
			end

			unless e.synonyms.nil?
				str.concat(" ~#{e.synonyms}")
			end
		end

		return str
	end
end