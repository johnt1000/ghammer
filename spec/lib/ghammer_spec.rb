require "spec_helper"
require "./lib/ghammer"
require "./lib/ghammer/dork"
require "./lib/ghammer/expr"

describe Ghammer  do
	describe "#initialized" do
		it "empty instance" do
			gh = Ghammer.new('http://testphp.vulnweb.com/')
      
      expect(gh.site).to match(/http:\/\/testphp.vulnweb.com/)
      expect(gh.dorks.length).to eq(0)
		end
	end
  
  describe "#loading_dorks" do
		it "loading all" do
			gh = Ghammer.new('http://testphp.vulnweb.com')
      gh.loading_dorks
      
      expect(gh.site).to match('http://testphp.vulnweb.com')
      expect(gh.dorks.length).to eq(2)
			expect(gh.dorks.first.expr.first.type).to match(/inurl/)
			expect(gh.dorks.first.expr.first.value).to match(/phpinfo/)
			expect(gh.dorks.first.expr.first.quoted).to be false
			expect(gh.dorks.first.expr.first.suppress).to be nil
			expect(gh.dorks.first.expr.first.synonyms).to be nil
			expect(gh.dorks.first.expr.last.type).to match(/text/)
			expect(gh.dorks.first.expr.last.value).to match("PHP Version")
			expect(gh.dorks.first.expr.last.quoted).to be true
			expect(gh.dorks.first.expr.last.suppress).to be nil
			expect(gh.dorks.first.expr.last.synonyms).to be nil
		end
  end
  
  describe "#get_dork" do
    it "#get_dork" do
			gh = Ghammer.new('http://testphp.vulnweb.com')
      gh.loading_dorks
      
      expect(gh.get_dork(0).to_s).to match(/site:http:\/\/testphp.vulnweb.com inurl:phpinfo "PHP Version"/)
      expect(gh.get_dork(1).to_s).to match(/site:http:\/\/testphp.vulnweb.com ext:sql/)
    end
  end
end