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
			expect(dk.version).to be nil
			expect(dk.deprecated).to be nil
			expect(dk.expr).to be nil
		end
	end

	describe "checking parameters" do
		it "starting and checking parameters." do
			dk = Dork.new
			dk.title = 'Title'
			dk.description = 'Description'
			dk.category = 'General'
			dk.author = 'Author'
			dk.version = 1.0
			dk.deprecated = false
			dk.expr = nil

			expect(dk.title).to match(/Title/)
			expect(dk.description).to match(/Description/)
			expect(dk.category).to match(/General/)
			expect(dk.author).to match(/Author/)
			expect(dk.version).to eq(1.0)
			expect(dk.deprecated).to be false
			expect(dk.expr).to be nil
		end

		it "checking insertion of new expressions in Dork." do
			dk = Dork.new

			e1 = Expr.new
			e1.type = 'text'
			e1.value = 'sando ixi ixii ixiiii'
			e1.quoted = true
			e1.suppress = 'ketchup'
			e1.synonyms = 'sanduíche'

			e2 = Expr.new
			e2.type = 'intitle'
			e2.value = 'entrevista'

			dk.add_expr(e1)
			dk.add_expr(e2)

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
		it "dork" do
			dk = Dork.new

			e1 = Expr.new
			e1.type = 'text'
			e1.value = 'sando ixi ixii ixiiii'
			e1.quoted = true
			e1.suppress = 'ketchup'
			e1.synonyms = 'sanduíche'

			e2 = Expr.new
			e2.type = 'intitle'
			e2.value = 'entrevista'

			dk.add_expr(e1)
			dk.add_expr(e2)

			expect(dk.to_s).to match(/ "sando ixi ixii ixiiii" -ketchup ~sanduíche intitle:entrevista/)
		end
	end
end