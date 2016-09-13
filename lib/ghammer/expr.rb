# encoding: UTF-8

class Expr
  attr_accessor :type
  attr_accessor :value
  attr_accessor :quoted
  attr_accessor :suppress
  attr_accessor :synonyms
  SPECIAL_OPERATORS = ['-', '~', 'or', 'OR', '|', '..', '*']
  SEARCH_OPERATORS  = [
    'allinanchor',
    'allintext',
    'allintitle',
    'allinurl',
    'cache',
    'define',
    'filetype',
    'id',
    'inanchor',
    'info',
    'intext',
    'intitle',
    'inurl',
    'phonebook',
    'related',
    'site',
    'author',
    'group',
    'insubject',
    'ext',
    'location',
    'source'
  ]

  def initialize(options = {})
    self.type = options.fetch(:type, nil)
    self.value = options.fetch(:value, nil)
    self.quoted = options.fetch(:quoted, false)
    self.suppress = options.fetch(:suppress, nil)
    self.synonyms = options.fetch(:synonyms, nil)
  end

  def decode
    str = String.new
    if self.search_operator?(self.type)
      str.concat "#{self.type}:"
    end

    if self.quoted == true
      str.concat "\"#{self.value}\""
    else
      str.concat "#{self.value}"
    end

    unless self.suppress.nil?
      self.suppress.each do |sup|
        str.concat " -#{sup}"
      end
    end

    unless self.synonyms.nil?
      self.synonyms.each do |syn|
        str.concat " ~#{syn}"
      end
    end

    return str
  end

  def search_operator?(str)
    SEARCH_OPERATORS.include?(str)
  end
end