# encoding: UTF-8
require "yaml"
require './util'

class Agent < Util
	
	def initialize
		load_config 'agent'
		@browser = @config['browser'].values
		@os = @config['os'].values
		@locale = @config['locale'].values
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
