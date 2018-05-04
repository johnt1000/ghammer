# encoding: UTF-8

class Domain
  
  def initialize
    yml = YAML.load_file(File.join(File.dirname(__FILE__), '..', '..', 'config', 'repo', 'domain.yml'))
    @url = yml['domain'].values
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
