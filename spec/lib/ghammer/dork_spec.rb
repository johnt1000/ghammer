require "spec_helper"
require "./lib/ghammer/dork"

describe Dork  do
	describe "#initialized" do
		it "empty instance" do
			dk = Dork.new

			expect(dk.title).to eq(nil)
			expect(dk.description).to eq(nil)
		end
	end
end