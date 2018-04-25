# encoding: UTF-8

require "spec_helper"

describe Proxy, 'whenever used'  do
  before do
    @proxy = Proxy.new({env: 'test'})
  end
  
  it "#initialize" do
    expect(@proxy.hostname.to_s).to match 'http://localhost'
    expect(@proxy.port.to_s).to match '9050'
    expect(@proxy.name.to_s).to match 'tor'
  end

  it "#to_s" do
    expect(@proxy.to_s).to match 'http://localhost:9050'
  end
end