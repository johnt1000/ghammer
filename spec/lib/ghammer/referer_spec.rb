# encoding: UTF-8

require "spec_helper"
require "./lib/ghammer/referer"

describe Referer, 'whenever used' do
  
  before { @referer = Referer.new }

  it "#to_s" do
    expect(@referer.to_s.nil?).to be false
    expect(@referer.to_s).to include('http', 'www', '//', '.', '/')
  end
end