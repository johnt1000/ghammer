# encoding: UTF-8

require "spec_helper"
require "./lib/ghammer/agent"

describe Agent  do
	describe "#initialized" do
		it "empty instance" do
			a = Agent.new

			expect(a.browser.count).to eq 58
			expect(a.browser.first).to match /Firefox/
			expect(a.browser.last).to match /Sylera/
			expect(a.os.count).to eq 114
			expect(a.os.first).to match /Windows 3.1/
			expect(a.os.last).to match /InfernoOS/
			expect(a.local.count).to eq 155
			expect(a.local.first).to match /cs-CZ/
			expect(a.local.last).to match /vi/
		end
	end

	it "#random" do
		a = Agent.new
		expect(a.random.nil?).to be false
	end

	it "#to_s" do
		a = Agent.new
		expect(a.to_s.nil?).to be false
	end
end