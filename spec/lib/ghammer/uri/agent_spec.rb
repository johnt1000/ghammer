# encoding: UTF-8

require "spec_helper"
require "./lib/ghammer/uri/agent"

describe Agent, 'whenever used' do
  
  before { @agent = Agent.new } # setup

  it "#to_s" do
    # exercise / verify
    expect(@agent.to_s.nil?).to be false
    expect(@agent.to_s).to include('/', '(', ')', ';', '.')
  end
end