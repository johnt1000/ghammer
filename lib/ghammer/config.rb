# encoding: UTF-8

class Config
	attr_accessor :env
	attr_accessor :path
	attr_accessor :params
	attr_accessor :yml

	def initialize(options = {})
    self.env = options.fetch(:env, 'production')
    self.path = options.fetch(:path, File.join(File.dirname(__FILE__), "..", "config"))
	end

	def loading
		self.yml = "#{self.path}/#{self.env}.yml"

		if self.file_exists?
			self.params = YAML.load_file(self.yml)
		else
			self.params = nil
		end
	end

	def file_exists?
		File.exist?(self.yml.to_s)
	end
end