# encoding: UTF-8

class Agent
  
	def initialize
    yml = YAML.load_file(File.join(File.dirname(__FILE__), '..', '..', 'config', 'repo', 'agent.yml'))
		@browser = yml['browser'].values
		@os = yml['os'].values
		@locale = yml['locale'].values
	end

	def to_s
		random
	end

	private
    def random
      str = String.new
      str.concat @browser.sample
      str.concat "/#{rand(20)}.#{rand(20)}"
      str.concat " ("
      str.concat "#{@os.sample} #{rand(7)}.#{rand(9)}; "
      str.concat "#{@locale.sample};"
      str.concat ")"
      str
    end
end
