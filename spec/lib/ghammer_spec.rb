require "spec_helper"
require "./lib/ghammer"
require "./lib/ghammer/dork"
require "./lib/ghammer/expr"

describe Ghammer  do
	describe "#initialized" do
		it "empty instance" do
			gh = Ghammer.new('http://testphp.vulnweb.com/')
      
      expect(gh.site).to match(/http:\/\/testphp.vulnweb.com/)
      expect(gh.searchs.length).to eq(0)
		end
	end
  
  describe "#loading_dorks" do
		it "loading all" do
			gh = Ghammer.new('http://testphp.vulnweb.com')
      gh.loading_dorks
      
      expect(gh.site).to match('http://testphp.vulnweb.com')
      expect(gh.searchs.length).to eq(2)
			expect(gh.searchs.first.dork.expr.first.type).to match(/inurl/)
			expect(gh.searchs.first.dork.expr.first.value).to match(/phpinfo/)
			expect(gh.searchs.first.dork.expr.first.quoted).to be false
			expect(gh.searchs.first.dork.expr.first.suppress).to be nil
			expect(gh.searchs.first.dork.expr.first.synonyms).to be nil
			expect(gh.searchs.first.dork.expr.last.type).to match(/text/)
			expect(gh.searchs.first.dork.expr.last.value).to match("PHP Version")
			expect(gh.searchs.first.dork.expr.last.quoted).to be true
			expect(gh.searchs.first.dork.expr.last.suppress).to be nil
			expect(gh.searchs.first.dork.expr.last.synonyms).to be nil
		end
  end
  
  it "#uri_search" do
		gh = Ghammer.new('http://testphp.vulnweb.com')
    gh.loading_dorks
      
    expect(gh.uri_search(0).to_s).to match(/site:http:\/\/testphp.vulnweb.com inurl:phpinfo "PHP Version"/)
    expect(gh.uri_search(1).to_s).to match(/site:http:\/\/testphp.vulnweb.com ext:sql/)
  end
end