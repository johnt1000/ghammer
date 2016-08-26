require "spec_helper"
require "./lib/ghammer/dork"

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
			expect(dk.dork).to be nil
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
			dk.dork = nil

			expect(dk.title).to match(/Title/)
			expect(dk.description).to match(/Description/)
			expect(dk.category).to match(/General/)
			expect(dk.author).to match(/Author/)
			expect(dk.version).to eq(1.0)
			expect(dk.deprecated).to be false
			expect(dk.dork).to be nil
		end
	end
end