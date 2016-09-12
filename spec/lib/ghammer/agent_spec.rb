# encoding: UTF-8

require "spec_helper"
require "./lib/ghammer/agent"

describe Agent, 'whenever used' do
  
  before { @agent = Agent.new } # setup
  
  it "#initialize" do
    # exercise / verify
    expect(@agent.browser.count).to eq 58
    expect(@agent.browser).to start_with('Firefox')
    expect(@agent.browser).to end_with('Sylera')
    expect(@agent.browser).to include('Konqueror', 'Sylera')
    # exercise / verify
    expect(@agent.os.count).to eq 114
    expect(@agent.os).to start_with('Windows 3.1')
    expect(@agent.os).to end_with('InfernoOS')
    expect(@agent.os).to include('iPad', 'openSuSE')
    # exercise / verify
    expect(@agent.local.count).to eq 155
    expect(@agent.local).to start_with('cs-CZ')
    expect(@agent.local).to end_with('vi')
    expect(@agent.local).to include('ar_SY', 'nl_NL')
  end

  it "#to_s" do
    # exercise / verify
    expect(@agent.to_s.nil?).to be false
    expect(@agent.to_s).to include('/', '(', ')', ';', '.')
  end
end