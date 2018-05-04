# encoding: UTF-8
require "spec_helper"

describe Query, 'whenever used' do
  
  before {
    @query = Query.new('http://testphp.vulnweb.com')
  } # setup
  
  it "#result" do
    result = @query.result
    # exercise / verify
    expect(result.nil?).to be false
    expect(result[:status][:success]).to match '200 OK'
    expect(result[:body]).to include('!DOCTYPE HTML PUBLIC', 'text/JavaScript')
  end
end