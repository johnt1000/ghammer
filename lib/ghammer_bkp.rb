$LOAD_PATH.unshift File.join(File.dirname(__FILE__), "..", "lib")

require 'ghammer/g_string'

class Ghammer
	
	def initialize
		@str = ''
		@dorks = []
	end

	def add_expr expression
		@dorks.push({ 'expression' => expression })
	end

	def process_dorks
		@dorks.each do |dork|
			if dork.key? "expression"
				@str.concat " #{dork['expression']}"
			end
		end
	end

	def to_s
		process_dorks
		@str
	end
end

g = Ghammer.new

st = GString.new('sando')
st.quoted('ixi ixi')

g.add_expr(st)
g.add_expr('sdasdasd')

puts g
#puts g.get_dorks.inspect