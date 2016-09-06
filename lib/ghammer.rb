# encoding: UTF-8

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), "config")
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), "ghammer")

APP_ROOT = File.join(File.dirname(__FILE__), "..")

require 'json'
require 'uri'
require 'curb'
require 'config'
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
  # ghammer
  attr_accessor :searchs
  attr_accessor :persist_number
  attr_accessor :dork_directory
  
  # search/proxy
  attr_accessor :target
  attr_accessor :result_per_page
  attr_accessor :output_directory
  attr_accessor :proxy_use
  attr_accessor :proxy_hostname
  attr_accessor :proxy_port
  
  # configuration
  attr_accessor :config
  
	def initialize(options = {})
    # configuration
    self.config = Config.new
    self.config.loading
    
    # ghammer
    self.persist_number = options.fetch(:persist_number, self.config.params["search"]["persist"]["number"])
    self.dork_directory = options.fetch(:dork_directory, self.config.params["dork"]["directory"])
    self.searchs = []
    
    # search/proxy
    self.target = options.fetch(:target, nil)
    self.result_per_page = options.fetch(:result_per_page, self.config.params["search"]["result"]["per_page"])
    self.output_directory = options.fetch(:output_directory, self.config.params["output"]["directory"])
    self.proxy_use = options.fetch(:proxy_use, self.config.params["proxy"]["use"])
    self.proxy_hostname = options.fetch(:proxy_hostname, self.config.params["proxy"]["hostname"])
    self.proxy_port = options.fetch(:proxy_port, self.config.params["proxy"]["port"])
    
	end
  
  def loading
    Dir["#{APP_ROOT}/#{self.dork_directory}/*.json"].each do |file|
      obj_file = File.read(file)
      
      json = JSON.parse(obj_file, { symbolize_names: true })
      dork = Dork.new(json)

      opts = {
        proxy_use: self.proxy_use,
        proxy_hostname: self.proxy_hostname,
        proxy_port: self.proxy_port,
        output_directory: self.output_directory,
        num_result: self.result_per_page
      } 
      search = Search.new(self.target, opts)
      search.dork = dork
      self.searchs.push(search)
    end
  end

  def run
    puts "\nCarregando Dorks. Aguarde..."
    self.loading
    puts "Dorks carregados.\n"

    t = Tool.new
    puts "\nIniciando Martelada...\n"
    puts "Meu IP: #{t.my_ip( { proxy: self.proxy_use } )}\n"
    puts "\n"

    i = 0
    repeat = 1
    while i < searchs.count
      search = self.searchs[i]

      str = String.new
      if repeat == 1
        str.concat "Rodando nova dork...\n"
        str.concat "Nome: #{search.dork.title}\n"
        str.concat "Descrição: #{search.dork.description}\n"
        str.concat "Dork: #{search.dork}\n"
      end

      if repeat <= self.persist_number
        str.concat "Tentativa: #{repeat} de #{self.persist_number}"
      end
      
      search.run

      if search.success?
        i += 1
        str.concat "\nSucesso: Consulta efetuada, resultado sendo analizado...\n"
        search.save
      else
        if repeat >= self.persist_number
          i += 1
          repeat = 1
          str.concat "\nFalha: Tentativas esgotadas.\n"
        else
          repeat += 1
          # TODO colocar em arquivo de configuração o valor padrão
          str.concat "\nRenovando IP do proxy...\n"
          t.tor_renew
          str.concat "Novo IP: #{t.my_ip( { proxy: self.proxy} )}"
        end
      end

      str.concat "\n"
      puts str
    end
  end
  
  def my_ip
    opts = {
      proxy_use: self.proxy_use,
      proxy_hostname: self.proxy_hostname,
      proxy_port: self.proxy_port
    }
    tool = Tool.new
    tool.my_ip(opts)
  end
end