# encoding: UTF-8

require 'i18n'
require 'yaml'
require 'json'
require 'uri'
require 'highline'
require 'highline/import'
require 'curb'
require 'config'
require 'expr'
require 'dork'
require 'dorks'
require 'agent'
require 'referer'
require 'domain'
require 'tool'
require 'proxy'
require 'query'
require 'search'
require 'banner'
require 'ghammer'

module GHF
  class App
    attr_accessor :target
    attr_accessor :verbose
    attr_accessor :debug
    attr_accessor :dork_directory
    attr_accessor :dork_categories
    attr_accessor :dork_expr_operator
    attr_accessor :proxy_use
    attr_accessor :proxy_hostname
    attr_accessor :proxy_port
    attr_accessor :output_directory
    attr_accessor :search_persist_number
    attr_accessor :search_result_per_page
    attr_accessor :query_delay
    attr_accessor :query_verbose

    def initialize(options = {})
      # configuration
      config = Config.new
      config.env =  options.fetch(:env, "production")
      config.path = File.join(APP_ROOT, 'config')
      if config.file_exists?
        # loading config
        config.loading
        
        # upload
        self.target = config.params["target"]
        self.verbose = config.params["verbose"]
        self.debug = config.params["debug"]
        self.dork_directory = config.params["dork"]["directory"]
        self.dork_categories = config.params["dork"]["categories"]
        #self.dork_expr_operator = config.params["dork"]["expr"]["operator"]
        self.proxy_use = config.params["proxy"]["use"]
        self.proxy_hostname = config.params["proxy"]["hostname"]
        self.proxy_port = config.params["proxy"]["port"]
        self.output_directory = config.params["output"]["directory"]
        self.search_persist_number = config.params["search"]["persist"]["number"]
        self.search_result_per_page = config.params["search"]["result"]["per_page"]
        self.query_delay = config.params["query"]["delay"]
        self.query_verbose = config.params["query"]["verbose"]
        
        # locale
        I18n.config.load_path += Dir[File.join(APP_ROOT, 'config','locales', '*.{rb,yml}').to_s]
        I18n.default_locale = :"#{config.params['locale']}"
      else
        puts "\s\sErro ao tentar abrir arquivo de configuração."
        puts "\s\sVerififque se existe o arquivo #{self.config.yml}.\n\n"
        Kernel.exit(true)
      end
    end
  end
end

class String
  def snakecase
    #gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr('-', '_').
    gsub(/\s/, '_').
    gsub(/__+/, '_').
    downcase
  end
end