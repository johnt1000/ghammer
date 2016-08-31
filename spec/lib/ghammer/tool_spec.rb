require "spec_helper"
require "./lib/ghammer/tool"

describe Search  do
	describe "#curl_installed?" do
		it "true" do
			t = Tool.new
			expect(t.curl_installed?).to be true
		end
	end

	#describe "#tor_installed?" do
	#	it "true" do
	#		t = Tool.new
	#		expect(t.tor_installed?).to be true
	#	end
	#end

	it "#curl_install" do
		t = Tool.new
		t.curl_install

		expect(t.curl_installed?).to be true
	end

	#it "#tor_install" do
	#	t = Tool.new
	#	t.tor_install
	#
	#	expect(t.tor_installed?).to be true
	#end

	describe "#tor_running?" do
		it "true" do
			t = Tool.new
			expect(t.tor_running?).to be true
		end
	end
end