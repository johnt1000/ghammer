# encoding: UTF-8

require "spec_helper"
require "./lib/ghammer/agent"
require "./lib/ghammer/referer"
require "./lib/ghammer/domain"
require "./lib/ghammer/expr"
require "./lib/ghammer/dork"
require "./lib/ghammer/search"

describe Search, 'whenever used' do
  before do
    @search = Search.new({ target: 'http://testphp.vulnweb.com' })
    
    @expr1 = {
      type: 'text',
      value: 'sandu ixiixiiixiiii',
      quoted: true,
      suppress: ['ketchup'],
      synonyms: ['sanduíche']
    }
    @expr2 = {
      type: 'intitle',
      value: 'entrevista'
    }
    @opts = {
      title: 'Title',
      description: 'Description',
      category: 'General',
      author: 'Author',
      version: 1.0,
      deprecated: false,
      expr: [@expr1,@expr2]
    }
    
    @dork = Dork.new @opts
  end
  
  it "#initialized" do
    expect(@search.target).to match "http://testphp.vulnweb.com"
    expect(@search.domain.nil?).to be false
    expect(@search.domain.to_s).to include('https://', 'www', 'google')
    expect(@search.result_per_page).to eq 1500
    expect(@search.persist_number).to eq 5
    expect(@search.proxy_use).to eq false
    expect(@search.output_directory).to eq 'spec/output_test'
    expect(@search.dork.nil?).to be true
  end

  it "#uri" do
    @search.dork = @dork
    
    expect(@search.uri).to match "site:http://testphp.vulnweb.com+%22sandu+ixiixiiixiiii%22+-ketchup+~sandu%C3%ADche+intitle:entrevista"
  end
	
  it "#to_s" do
    @search.dork = @dork

    expect(@search.to_s.nil?).to be false
    expect(@search.to_s).to include('https://', 'www', 'google', "/search?q=#{@search.uri}&num=#{@search.result_per_page}btnG=Search&pws=1")
  end
end