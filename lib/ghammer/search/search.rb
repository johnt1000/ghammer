# encoding: UTF-8

class Search
  # search
  attr_accessor :target
  attr_accessor :domain
  attr_accessor :dork
  attr_accessor :result_per_page
  attr_accessor :persist_number
  # proxy
  attr_accessor :proxy_use
  # query
  attr_accessor :query
  # results
  attr_accessor :output_directory

  def initialize(options = {})
    #search
    self.target = options.fetch(:target, CONFIG.target)
    self.domain = Domain.new
    self.result_per_page = options.fetch(:result_per_page, CONFIG.search_result_per_page)
    self.persist_number = options.fetch(:result_per_page, CONFIG.search_persist_number)
    self.proxy_use = options.fetch(:proxy_use, CONFIG.proxy_use)
    self.output_directory = options.fetch(:output_directory, CONFIG.output_directory)
  end

  # TODO test
  def run
    self.query = Query.new(self.to_s)
    self.query.proxy_use = self.proxy_use
    self.query.run
  end
  
  # TODO test
  # TODO create class result
  def save
    Dir.mkdir(self.output_directory, 0700) unless Dir.exist?(self.output_directory)

    output = File.open( "#{self.output_directory}/#{self.dork.md5}.html","w" )
    output << self.query.result
    output.close
  end

  # TODO test
  def success?
    if self.query.status == "200 OK"
      true
    else
      false
    end
  end

  def uri
    uri = URI.escape("site:#{self.target}")
    "#{uri}+#{self.dork.uri}"
  end

  def to_s
    "#{self.domain}/search?q=#{self.uri}&num=#{self.result_per_page}btnG=Search&pws=1"
  end
end