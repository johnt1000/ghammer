# $LOAD_PATH.unshift File.join(File.dirname(__FILE__), "..", "lib", "ghammer", "*")
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), "ghammer")

require 'json'
require 'uri'
require 'expr'
require 'dork'
require 'search'
require 'agent'
require 'referer'
require 'domain'
require 'tool'

class Ghammer
  
  attr_accessor :site
  attr_accessor :searchs
  
	def initialize(site)
    self.site = site
    self.searchs = []
	end
  
  def loading_dorks
    Dir[File.dirname(__FILE__) + '/../dorks/*.json'].each do |file|
      obj_file = File.read(file)
      
      json = JSON.parse(obj_file, {symbolize_names: true})
      dork = Dork.new(json)

      search = Search.new(self.site)
      search.dork = dork
      self.searchs.push(search)
    end
  end
  
  def uri_search(index)
    "#{self.searchs[index]}"
  end
end