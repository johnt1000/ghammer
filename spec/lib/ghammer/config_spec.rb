# encoding: UTF-8

require "spec_helper"
require "./lib/ghammer/config"

describe Config, "using config/*.yml file" do
  context 'Nit when the configuration file exists' do
    
    before {
      file = File.join(File.dirname(__FILE__), '..', '..', '..', 'config', 'test.yml')
      @config = Config.new({env: 'test', path: file.to_s})
    } # setup
    
    it "#initialized" do
      # exercise / verify
      expect(@config.env).to match /test/
      expect(@config.path).to match /config/
      expect(@config.yml['target']).to match /http:\/\/testphp.vulnweb.com/
    end
  end
end