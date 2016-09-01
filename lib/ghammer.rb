# encoding: UTF-8

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), "ghammer")

require 'json'
require 'uri'
require 'expr'
require 'dork'
require 'agent'
require 'referer'
require 'domain'
require 'tool'
require 'proxy'
require 'query'
require 'search'

class Ghammer
  
  attr_accessor :site
  attr_accessor :proxy
  attr_accessor :searchs
  
	def initialize(site, options = {})
    self.proxy = options.fetch(:proxy, false)
    self.site = site
    self.searchs = []
	end
  
  def loading
    # TODO colocar em arquivo de configuração o valor padrão
    Dir[File.dirname(__FILE__) + '/../dorks/*.json'].each do |file|
      obj_file = File.read(file)
      
      json = JSON.parse(obj_file, {symbolize_names: true})
      dork = Dork.new(json)

      search = Search.new(self.site)
      search.dork = dork
      self.searchs.push(search)
    end
  end

  def run
    self.loading
    self.searchs.each do |search|
      puts search.to_s
      search.run
    end
  end
end