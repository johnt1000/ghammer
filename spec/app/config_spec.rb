# encoding: UTF-8
require "spec_helper"

describe Config, "using config/*.yml file" do
  context 'Nit when the configuration file exists' do
    
    before {
      @config = Config.new({env: 'test'})
    } # setup
    
    it "#initialized" do
      # exercise / verify
      expect(@config.env).to match /test/
      expect(@config.yml['target']).to match /http:\/\/testphp.vulnweb.com/
    end
  end
end