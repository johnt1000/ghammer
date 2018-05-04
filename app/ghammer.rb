# encoding: UTF-8

class Ghammer
  # ghammer
  attr_accessor :search

  def initialize(options = {})
    @search = Search.new({ target: 'http://testphp.vulnweb.com' })
    @dorks = Dork.all
  end

  def run
    @dorks.each do |dork|
      @search.dork = dork
      @search.run
      @search.save
    end
  end

  def my_ip
    tool = Tool.new
    tool.my_ip(proxy_use: self.proxy_use)
  end
end
