# encoding: UTF-8

class Dork
  attr_accessor :title
  attr_accessor :description
  attr_accessor :category
  attr_accessor :category_child
  attr_accessor :author
  attr_accessor :md5
  attr_accessor :version
  attr_accessor :deprecated
  attr_accessor :expr
  CATEGORIES = [
    'Vulnerable files',
    'Vulnerable servers',
    'Error messages',
    'Network or vulnerability data',
    'Various online devices',
    'Files containing passwords',
    'Sensitive online shopping info',
    'Files containing juicy info',
    'Pages containing login portals',
    'Advisories and vulnerabilities',
    'Files containing usernames',
    'Footholds',
    'Sensitive directories',
    'Web server detection'
  ]

  def initialize(options = {})
    self.title = options.fetch(:title, nil)
    self.description = options.fetch(:description, nil)
    self.category = options.fetch(:category, nil)
    self.category_child = options.fetch(:category_child, nil)
    self.author = options.fetch(:author, nil)
    self.md5 = options.fetch(:md5, nil)
    self.version = options.fetch(:version , 0)
    self.deprecated = options.fetch(:deprecated, false)
    self.add_expr(options.fetch(:expr, []))
  end

  def add_expr(exprs = [])
    self.expr = [] if self.expr.nil?
    exprs.each do |expr|
      self.expr.push(Expr.new(expr))
    end
  end
  
  def uri
    str = self.to_s.gsub(' ', '+')
    URI.escape(str)
  end
  
  def to_s
    str = String.new
    self.expr.each do |e|
      str.concat(" #{e.decode}")
    end
    return str.strip
  end
end