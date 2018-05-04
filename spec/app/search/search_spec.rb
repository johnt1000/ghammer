# encoding: UTF-8
require "spec_helper"

describe Search, 'whenever used' do
  before do
    @search = Search.new({ target: 'http://testphp.vulnweb.com' })
    @dork = Dork.find 2
  end
  
  it "#initialized" do
    expect(@search.target).to match "http://testphp.vulnweb.com"
    expect(@search.result_per_page).to eq 1500
    expect(@search.persist_number).to eq 5
    expect(@search.dork.nil?).to be true
  end
  
  it '#dork' do
    @search.dork = @dork
    expect(@search.domain.nil?).to be false
    expect(@search.domain.to_s).to include('https://', 'www', 'google')
  end

  it "#uri" do
    @search.dork = @dork
    expect(@search.uri).to match "site:http://testphp.vulnweb.com+#{@dork.search}"
  end

  it "#to_s" do
    @search.dork = @dork
    expect(@search.to_s).to include('https://', 'www', 'google',
                              '/search?q=site:http://testphp.vulnweb.com+' + 
                              "#{@dork.search}&num=1500btnG=Search&pws=1")
  end
  
  it "#run" do
    @search.dork = @dork
    @search.run
    
    expect(@search.search_result[:status][:success]).to match '200 OK'
    expect(@search.search_result[:body]).to include('!doctype html')
  end
  
  it "#save" do
    Result.delete_all
    @search.dork = @dork
    @search.run
    @search.save
    
    rs = Result.all.count
    
    expect(rs).to eq 1
  end
end