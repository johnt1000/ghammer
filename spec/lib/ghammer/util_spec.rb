# encoding: UTF-8

require "spec_helper"
require "./lib/ghammer/util"

describe Util  do
  before { @util = Util.new } # setup
  
  it "#load_config_yml" do
    file = File.join(File.dirname(__FILE__), '..', '..', '..', 'config', 'test.yml')
    @util.load_config_yml(file)
    
    # exercise / verifye
    expect(@util.config['target']).to match /http:\/\/testphp.vulnweb.com/
  end
end