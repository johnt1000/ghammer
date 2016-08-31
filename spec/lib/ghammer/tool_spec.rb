require "spec_helper"
require "./lib/ghammer/tool"

describe Search  do
	it "#app_installed" do
		t = Tool.new

		expect( t.curl_installed?).to be true
	end
end