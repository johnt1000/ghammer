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
  attr_accessor :proxy_renew
  attr_accessor :searchs
  
	def initialize(site, options = {})
    # TODO colocar em arquivo de configuração o valor padrão
    self.proxy = options.fetch(:proxy, false)
    self.proxy_renew = options.fetch(:proxy, true)
    self.site = site
    self.searchs = []
	end
  
  def loading
    # TODO colocar em arquivo de configuração o valor padrão
    Dir[File.dirname(__FILE__) + '/../dorks/*.json'].each do |file|
      obj_file = File.read(file)
      
      json = JSON.parse(obj_file, { symbolize_names: true })
      dork = Dork.new(json)

      search = Search.new(self.site, { proxy: self.proxy })
      search.dork = dork
      self.searchs.push(search)
    end
  end

  def get_search(index)
    self.searchs[index]
  end

  def run
    puts "\nCarregando Dorks. Aguarde..."
    self.loading
    puts "Dorks carregados.\n"

    t = Tool.new
    puts "\nIniciando Martelada...\n"
    puts "Meu atual: #{t.my_ip( { proxy: self.proxy } )}\n"
    puts "\n"

    i = 0
    repeat = 1
    while i < searchs.count
      search = self.get_search(i)

      str = String.new
      if repeat == 1
        str.concat "Rodando nova dork...\n"
        str.concat "Nome: #{search.dork.title}\n"
        str.concat "Descrição: #{search.dork.description}\n"
        str.concat "Dork: #{search.dork}\n"
      end

      # TODO colocar em arquivo de configuração o valor padrão
      # TODO o numero 3
      if repeat <= 3
        str.concat "Tentativa: #{repeat} de 3"
      end
      
      search.run

      if search.success?
        i += 1
        str.concat "\nSucesso: Consulta efetuada, resultado sendo analizado...\n"
        search.save
      else
        # TODO colocar em arquivo de configuração o valor padrão
        if repeat >= 3 # <- isso tem que ir para um .conf
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

    #self.searchs.each do |search|
    #  str = String.new
    #  str.concat "Iniciando nova busca..."
    #  str.concat "\n"
    #  str.concat "\n"
    #  str.concat "Dork: #{search.dork}"
    #  puts str
    #  
    #  search.run
    #end
  end
end