class Dork < ApplicationRecord
  belongs_to :category
  has_many :results
  
  before_validation :clear_search
  
  def clear_search
    self.search.gsub!(' ', '%20')
    self.search.gsub!('!', '%21')
    self.search.gsub!('"', '%22')
    self.search.gsub!('#', '%23')
    self.search.gsub!('$', '%24')
    self.search.gsub!('%', '%25')
    self.search.gsub!('&', '%26')
    self.search.gsub!("'", '%27')
    self.search.gsub!('(', '%28')
    self.search.gsub!(')', '%29')
    self.search.gsub!('*', '%2A')
    self.search.gsub!('+', '%2B')
    self.search.gsub!(',', '%2C')
    self.search.gsub!('-', '%2D')
    self.search.gsub!('.', '%2E')
    self.search.gsub!('/', '%2F')
    
    self.search.gsub!(':', '%3A')
    self.search.gsub!(';', '%3B')
    self.search.gsub!('<', '%3C')
    self.search.gsub!('=', '%3D')
    self.search.gsub!('>', '%3E')
    self.search.gsub!('?', '%3F')
    
    self.search.gsub!('@', '%40')
    
    self.search.gsub!('[', '%5B')
    self.search.gsub!('\\', '%5C')
    self.search.gsub!(']', '%5D')
    self.search.gsub!('ˆ', '%5E')
    self.search.gsub!('_', '%5F')
    
    self.search.gsub!('{', '%7B')
    self.search.gsub!('|', '%7C')
    self.search.gsub!('}', '%7D')
    self.search.gsub!('˜', '%7E')
  end
end