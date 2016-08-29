# $LOAD_PATH.unshift File.join(File.dirname(__FILE__), "..", "lib", "ghammer", "*")
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), "ghammer")

#require 'ghammer/g_string'
require 'json'
require 'expr'
require 'dork'

class Ghammer
  
  attr_accessor :site
  attr_accessor :dorks
  
	def initialize(site)
    self.site = site
    self.dorks = []
	end
  
  def loading_dorks
    Dir[File.dirname(__FILE__) + '/../dorks/*.json'].each do |file|
      obj_file = File.read(file)
      json_dork = JSON.parse(obj_file, {symbolize_names: true})
      obj_dork = Dork.new(json_dork)
      self.dorks.push(obj_dork)
    end
  end
  
  def get_dork(index)
    "site:#{self.site} #{dorks[index]}"
  end
end