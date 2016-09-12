# encoding: UTF-8

require "spec_helper"
require "./lib/ghammer/referer"

describe Referer, 'whenever used' do
  before { @referer = Referer.new }
  
  it "#initialized" do
    expect(@referer.domain.count).to eq 69
    expect(@referer.domain).to start_with('Adzuna')
    expect(@referer.domain).to end_with('Zoopla')
    expect(@referer.domain).to include('Lexis', 'CiteAb')
      
    expect(@referer.tld.count).to eq 16
    expect(@referer.tld).to start_with('aero')
    expect(@referer.tld).to end_with('tel')
    expect(@referer.tld).to include('coop', 'info')
      
    expect(@referer.file.count).to eq 16
    expect(@referer.file).to start_with('admin')
    expect(@referer.file).to end_with('view')
    expect(@referer.file).to include('shop', 'news')
      
    expect(@referer.ext.count).to eq 16
    expect(@referer.ext).to start_with('exe')
    expect(@referer.ext).to end_with('rss')
    expect(@referer.ext).to include('htm', 'py')
      
    expect(@referer.folder.count).to eq 142
    expect(@referer.folder).to start_with('App_Files')
    expect(@referer.folder).to end_with('acc_syun_su')
    expect(@referer.folder).to include('Dashboard', 'Help')

    expect(@referer.local.count).to eq 246
    expect(@referer.local).to start_with('ac')
    expect(@referer.local).to end_with('ai')
    expect(@referer.local).to include('bm', 'cu')
  end

  it "#to_s" do
    expect(@referer.to_s.nil?).to be false
    expect(@referer.to_s).to include('http', 'www', '//', '.', '/')
  end
end