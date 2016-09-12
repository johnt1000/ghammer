# encoding: UTF-8

class Ghammer
  # ghammer
  attr_accessor :searchs
  # search/proxy
  attr_accessor :target
  attr_accessor :proxy_use
  attr_accessor :dork_directory
  
  
  def initialize(options = {})
    # ghammer
    self.searchs = []
    
    # search/proxy
    self.target = options.fetch(:target, CONFIG.target)
    self.proxy_use = options.fetch(:proxy_use, CONFIG.proxy_use)
    self.dork_directory = options.fetch(:dork_directory, CONFIG.dork_directory)
  end
  
  def loading
    Dir["#{APP_ROOT}/#{self.dork_directory}/*.json"].each do |file|
      obj_file = File.read(file)
      
      json = JSON.parse(obj_file, { symbolize_names: true })
      dork = Dork.new(json)

      search = Search.new(proxy_use: self.proxy_use, target: self.target)
      search.dork = dork
      self.searchs.push(search)
    end
  end

  def run
    puts "\nCarregando Dorks. Aguarde..."
    self.loading
    puts "Dorks carregados.\n"

    puts "\nIniciando Martelada...\n"
    puts "Meu IP: #{self.my_ip}\n"
    puts "\n"

    i = 0
    while i < searchs.count
      search = self.searchs[i]

      str = String.new
      if search.persist_number == CONFIG.search_persist_number
        str.concat "Rodando nova dork...\n"
        str.concat "Nome: #{search.dork.title}\n"
        str.concat "Descrição: #{search.dork.description}\n"
        str.concat "Dork: #{search.dork}\n"
      end

      #if repeat <= self.persist_number
      #  str.concat "Tentativa: #{repeat} de #{self.persist_number}"
      #end
      
      search.run

      if search.success?
        i += 1
        str.concat "\nSucesso: Consulta efetuada, resultado sendo analizado...\n"
        search.save
      else
        if search.persist_number < 1
          i += 1
          str.concat "\nFalha: Tentativas esgotadas.\n"
        else
          search.persist_number -= 1
          str.concat "\nRenovando IP do proxy...\n"
          search.query.proxy.renew
          str.concat "Novo IP: #{self.my_ip}"
        end
      end

      str.concat "\n"
      puts str
    end
  end
  
  def my_ip
    tool = Tool.new
    tool.my_ip(proxy_use: self.proxy_use)
  end
end