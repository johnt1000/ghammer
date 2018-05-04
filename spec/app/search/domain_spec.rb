# encoding: UTF-8

require "spec_helper"

describe Domain, 'whenever used' do
  
  before { @domain = Domain.new } # setup

  it "#to_s" do
    expect(@domain.to_s.nil?).to be false
    expect(@domain.to_s).to include('https://', 'www', 'google')
  end
end