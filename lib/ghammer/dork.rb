class Dork
	
	attr_accessor :title
	attr_accessor :description
	attr_accessor :category
	attr_accessor :author
	attr_accessor :version
	attr_accessor :deprecated
  attr_accessor :expr

	def initialize(options = {})
    self.title = options.fetch(:title, nil)
    self.description = options.fetch(:description, nil)
    self.category = options.fetch(:category, nil)
    self.author = options.fetch(:author, nil)
    self.version = options.fetch(:version, 0)
    self.deprecated = options.fetch(:deprecated, false)
    self.add_expr(options.fetch(:expr, []))
	end

  def add_expr(exprs = [])
    if self.expr.nil?
      self.expr =  []
    end
    exprs.each do |expr|
      self.expr.push(Expr.new(expr))
    end
  end

	def to_s
		str = String.new

		self.expr.each do |e|
			case e.type
			when 'text'
				str.concat(" #{e.value}") if e.quoted == false
				str.concat(" \"#{e.value}\"") if e.quoted == true
			#when 'intitle'
			#	str.concat(" intitle:#{e.value}") if e.quoted == false
			#	str.concat(" intitle:\"#{e.value}\"") if e.quoted == true
			#when 'ext'
			#	str.concat(" ext:#{e.value}") if e.quoted == false
			#	str.concat(" ext:\"#{e.value}\"") if e.quoted == true
			else
				str.concat(" #{e.type}:#{e.value}") if e.quoted == false
				str.concat(" #{e.type}:\"#{e.value}\"") if e.quoted == true
			end

			unless e.suppress.nil?
				str.concat(" -#{e.suppress}")
			end

			unless e.synonyms.nil?
				str.concat(" ~#{e.synonyms}")
			end
		end

		return str.strip
	end
end