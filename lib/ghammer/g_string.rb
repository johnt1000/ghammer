class GString < String
	def quoted(str)
		if self.length.eql? 0
			self.concat "\"#{str}\""
		else
			self.concat " \"#{str}\""
		end
	end
end