# encoding: UTF-8

require "spec_helper"
require "./lib/ghammer/expr"

describe Expr  do
	describe "#initialized" do
		it "empty instance" do
			e = Expr.new

			expect(e.type).to be nil
			expect(e.value).to be nil
			expect(e.quoted).to be false
			expect(e.suppress).to be nil
			expect(e.synonyms).to be nil
		end
	end

	describe "checking parameters" do
		it "starting and checking parameters." do
			opts = {
        type: 'text',
        value: 'sando ixi ixii ixiiii',
        quoted: true,
        suppress: 'ketchup',
        synonyms: 'sanduíche'
      }
			e = Expr.new(opts)

			expect(e.type).to match(/text/)
			expect(e.value).to match(/sando ixi ixii ixiiii/)
			expect(e.quoted).to be true
			expect(e.suppress).to match(/ketchup/)
			expect(e.synonyms).to match(/sanduíche/)
		end
	end
end