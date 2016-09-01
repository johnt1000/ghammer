# encoding: UTF-8

require "spec_helper"
require "./lib/ghammer/referer"

describe Referer  do
	describe "#initialized" do
		it "empty instance" do
			a = Referer.new

			expect(a.domain.count).to eq 69
			expect(a.domain.first).to match /Adzuna/
			expect(a.domain.last).to match /Zoopla/
			expect(a.tld.count).to eq 16
			expect(a.tld.first).to match /aero/
			expect(a.tld.last).to match /tel/
			expect(a.file.count).to eq 16
			expect(a.file.first).to match /admin/
			expect(a.file.last).to match /view/
			expect(a.ext.count).to eq 16
			expect(a.ext.first).to match /exe/
			expect(a.ext.last).to match /rss/
			expect(a.folder.count).to eq 142
			expect(a.folder.first).to match /App_Files/
			expect(a.folder.last).to match /acc_syun_su/
			expect(a.local.count).to eq 246
			expect(a.local.first).to match /ac/
			expect(a.local.last).to match /ai/
		end
	end

	it "#random" do
		a = Referer.new
		expect(a.random.nil?).to be false
	end
end