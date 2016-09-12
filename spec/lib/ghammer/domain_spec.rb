# encoding: UTF-8

require "spec_helper"
require "./lib/ghammer/domain"

describe Domain, 'whenever used' do
  before { @domain = Domain.new } # setup
  it "#initialized" do
    # exercise / verify
    expect(@domain.url.count).to eq 191
    expect(@domain.url).to start_with('www.google.com')
    expect(@domain.url).to end_with ('www.google.co.zw')
    expect(@domain.url).to all(be_a(String).and start_with('www.google'))
    expect(@domain.url).to include('www.google.cd', 'www.google.ci')
    expect(@domain.protocol).to match('https')
  end

  it "#to_s" do
    expect(@domain.to_s.nil?).to be false
    expect(@domain.to_s).to include('https://', 'www', 'google')
  end
end