# encoding: UTF-8
require File.join(File.dirname(__FILE__), "util")

class Domain < Util
  def initialize
    file = File.join(File.dirname(__FILE__), '..', '..', 'config', 'repo', 'domain.yml')
		load_config_yml file.to_s
    @url = @config['domain'].values
  end

  def to_s
    random
  end

  private
    def random
      str = String.new
      str.concat "https://"
      str.concat @url.sample.downcase
      str
    end
end
