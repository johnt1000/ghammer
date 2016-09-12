# encoding: UTF-8

require "spec_helper"
require "./lib/ghammer/tool"
require "./lib/ghammer/proxy"

describe Proxy, 'whenever used'  do
  before do
    @opts = { hostname: 'http://localhost', port: 9050 }
    @proxy = Proxy.new(@opts)
  end
  
  it "#initialize" do
    expect(@proxy).to have_attributes(@opts)
  end

  it "#to_s" do
    expect(@proxy.to_s).to match 'http://localhost:9050'
  end

  # it "#running?" do
  #   proxy = Proxy.new({hostname: 'http://localhost', port: 9050})
  #   expect(proxy.running?).to be Tool.new().tor_running?
  # end
end