# encoding: UTF-8
require File.join(File.dirname(__FILE__), '..', 'util')

class Referer < Util
  
  def initialize
    file = File.join(File.dirname(__FILE__), '..', '..', '..', 'config', 'repo', 'referer.yml')
		load_config_yml file.to_s
    @domain = @yml['domain'].values
    @tld = @yml['tld'].values
    @file = @yml['file'].values
    @ext = @yml['ext'].values
    @folder = @yml['folder'].values
    @locale = @yml['locale'].values
  end

  def to_s
    random
  end

  private
    def random
      str = String.new
      str.concat "http://www."
      str.concat @domain.sample.downcase
      str.concat '.'
      str.concat @tld.sample.downcase
      str.concat '.'
      str.concat @locale.sample.downcase
      str.concat '/'
      str.concat @folder.sample.downcase
      str.concat '/'
      str.concat @file.sample.downcase
      str.concat '.'
      str.concat @ext.sample.downcase
      str
    end
end
