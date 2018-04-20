# encoding: UTF-8
require "yaml"
require './util'

class Referer < Util

  def initialize
    load_config 'referer'
    @domain = @config['domain'].values
    @tld = @config['tld'].values
    @file = @config['file'].values
    @ext = @config['ext'].values
    @folder = @config['folder'].values
    @locale = @config['locale'].values
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
