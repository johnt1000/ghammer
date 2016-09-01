# encoding: UTF-8

require "spec_helper"
require "./lib/ghammer/agent"
require "./lib/ghammer/referer"
require "./lib/ghammer/domain"
require "./lib/ghammer/expr"
require "./lib/ghammer/dork"
require "./lib/ghammer/search"

describe Search  do
	describe "#initialized" do
		it "empty instance" do
			s = Search.new('http://testphp.vulnweb.com')

			expect(s.site).to match "http://testphp.vulnweb.com"
			expect(s.domain.nil?).to be false
			expect(s.num_result).to eq 1500
			expect(s.dork.nil?).to be true
		end
	end

	it "#uri" do
		expr1 = {
      type: 'text',
      value: 'sando ixi ixii ixiiii',
      quoted: true,
      suppress: 'ketchup',
      synonyms: 'sanduíche'
    }
		expr2 = {
      type: 'intitle',
      value: 'entrevista'
    }
    opts = {
      title: 'Title',
      description: 'Description',
      category: 'General',
      author: 'Author',
      version: 1.0,
      deprecated: false,
      expr: [expr1,expr2]
    }
		dk = Dork.new opts
		s = Search.new('http://testphp.vulnweb.com')
		s.dork = dk

		expect(s.uri).to match "site:http://testphp.vulnweb.com+%22sando+ixi+ixii+ixiiii%22+-ketchup+~sandu%C3%ADche+intitle:entrevista"
	end
	
	it "#to_s" do
		expr1 = {
      type: 'text',
      value: 'sando ixi ixii ixiiii',
      quoted: true,
      suppress: 'ketchup',
      synonyms: 'sanduíche'
    }
		expr2 = {
      type: 'intitle',
      value: 'entrevista'
    }
    opts = {
      title: 'Title',
      description: 'Description',
      category: 'General',
      author: 'Author',
      version: 1.0,
      deprecated: false,
      expr: [expr1,expr2]
    }
		dk = Dork.new opts
		
		s = Search.new('http://testphp.vulnweb.com')
		s.dork = dk

		#str = "#{s.domain}/search?q=%22sando+ixi+ixii+ixiiii%22+-ketchup+~sandu%C3%ADche+intitle:entrevista&num=1500btnG=Search&pws=1"
		#expect(s.to_s).to match(str)
		expect(s.to_s.nil?).to be false
	end
end