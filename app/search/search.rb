# encoding: UTF-8

class Search
  # search
  attr_accessor :target
  attr_accessor :domain
  attr_accessor :dork
  attr_accessor :result_per_page
  attr_accessor :persist_number
  # query
  attr_accessor :search_result

  def initialize(options = {})
    @target = options.fetch(:target, CONFIG.yml['target'])
    @result_per_page = options.fetch(:result_per_page, CONFIG.yml['search']['result']['per_page'])
    @persist_number = options.fetch(:result_per_page, CONFIG.yml['search']['persist']['number'])
  end
  
  def dork=(dork)
    @domain = Domain.new
    @dork = dork
  end

  def uri
    uri = URI.escape("site:#{@target.to_s}")
    uri.concat('+').concat(@dork.search)
  end

  def to_s
    @domain.to_s.concat('/search?q=').concat(uri).concat('&num=')
           .concat(@result_per_page.to_s).concat('btnG=Search&pws=1')
  end
  
  def run
    query = Query.new(self.to_s)
    @search_result = query.result
  end
  
  def save
    rst = Result.new
    rst.target = @target
    rst.dork_id = @dork.id
    rst.str_body = @search_result[:body].to_s.encode('UTF-8', invalid: :replace, undef: :replace, replace: '?')
    unless @search_result[:status][:success].nil?
      rst.status = 'success'
      rst.message = @search_result[:status][:success]
    else
      rst.status = 'error'
      rst.message = @search_result[:status][:error]
    end
    rst.save
  end  
end