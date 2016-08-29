require "spec_helper"
require "./lib/ghammer"
require "./lib/ghammer/dork"
require "./lib/ghammer/expr"

describe Ghammer  do
	describe "#initialized" do
		it "empty instance" do
			gh = Ghammer.new('http://www.target.com')
      
      expect(gh.site).to match(/http:\/\/www.target.com/)
      expect(gh.dorks.length).to eq(0)
		end
	end
  
  describe "#loading_dorks" do
		it "loading all" do
			gh = Ghammer.new('http://www.target.com')
      gh.loading_dorks
      
      expect(gh.site).to match('http://www.target.com')
      expect(gh.dorks.length).to eq(2)
			expect(gh.dorks.first.expr.first.type).to match(/text/)
			expect(gh.dorks.first.expr.first.value).to match(/sanduíche/)
			expect(gh.dorks.first.expr.first.quoted).to be true
			expect(gh.dorks.first.expr.first.suppress).to match(/ketchup/)
			expect(gh.dorks.first.expr.first.synonyms).to match(/sanduíche/)
		end
  end
  
  describe "#get_dork" do
    it "#get_dork" do
			gh = Ghammer.new('http://www.target.com')
      gh.loading_dorks
      
      expect(gh.get_dork(0).to_s).to match(/site:http:\/\/www.target.com "sanduíche" -ketchup ~sanduíche intitle:entrevista/)
      expect(gh.get_dork(1).to_s).to match(/site:http:\/\/www.target.com "mail" ext:xls/)
    end
  end
end