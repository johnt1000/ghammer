require "spec_helper"
require "./lib/ghammer/dork"
require "./lib/ghammer/expr"

describe Dork  do
	describe "#initialized" do
		it "empty instance" do
			dk = Dork.new

			expect(dk.title).to be nil
			expect(dk.description).to be nil
			expect(dk.category).to be nil
			expect(dk.author).to be nil
			expect(dk.version).to be 0
			expect(dk.deprecated).to be false
			expect(dk.expr.length).to eq(0)
		end
	end

	describe "checking parameters" do
		it "starting and checking parameters." do
      opts = {
        title: 'Title',
        description: 'Description',
        category: 'General',
        category_child: 'General Child',
        author: 'Author',
        version: 1.0,
        deprecated: false,
        expr: []
      }
			dk = Dork.new(opts)

			expect(dk.title).to match(/Title/)
			expect(dk.description).to match(/Description/)
			expect(dk.category).to match(/General/)
			expect(dk.category_child).to match(/General Child/)
			expect(dk.author).to match(/Author/)
			expect(dk.version).to eq(1.0)
			expect(dk.deprecated).to be false
			expect(dk.expr.length).to eq(0)
		end

		it "checking insertion of new expressions in Dork." do
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

			expect(dk.expr[0].type).to match(/text/)
			expect(dk.expr[0].value).to match(/sando ixi ixii ixiiii/)
			expect(dk.expr[0].quoted).to be true
			expect(dk.expr[0].suppress).to match(/ketchup/)
			expect(dk.expr[0].synonyms).to match(/sanduíche/)

			expect(dk.expr[1].type).to match(/intitle/)
			expect(dk.expr[1].value).to match(/entrevista/)
			expect(dk.expr[1].quoted).to be false
			expect(dk.expr[1].suppress).to be nil
			expect(dk.expr[1].synonyms).to be nil
		end
	end

	describe "#to_s" do
		it "return string." do
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

			expect(dk.to_s).to match(/"sando ixi ixii ixiiii" -ketchup ~sanduíche intitle:entrevista/)
		end
	end
end