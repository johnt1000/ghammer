require "spec_helper"
require "./lib/ghammer/domain"

describe Domain  do
	describe "#initialized" do
		it "empty instance" do
			a = Domain.new

			expect(a.url.count).to eq 191
			expect(a.url.first).to match /www.google.com/
			expect(a.url.last).to match /www.google.co.zw/
		end
	end

	it "#random" do
		a = Domain.new
		expect(a.random.nil?).to be false
	end
end