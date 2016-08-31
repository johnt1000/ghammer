require "spec_helper"
require "./lib/ghammer/tool"
require "./lib/ghammer/proxy"

describe Proxy  do
	it "#initialize" do
		p = Proxy.new

		expect(p.hostname).to match 'http://127.0.0.1'
		expect(p.port).to eq 9050
		expect(p.status).to be true
	end

	it "#to_s" do
		p = Proxy.new

		expect(p.to_s).to match 'http://127.0.0.1:9050'
	end
end