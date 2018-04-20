# encoding: UTF-8
require "yaml"
require './util'

class Domain < Util
  def initialize
    load_config 'domain'
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
