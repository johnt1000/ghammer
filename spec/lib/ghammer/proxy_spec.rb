# encoding: UTF-8

require "spec_helper"
require "./lib/ghammer/tool"
require "./lib/ghammer/proxy"

describe Proxy  do
	it "#initialize" do
		proxy = Proxy.new({hostname: 'http://localhost', port: 9050})

		expect(proxy.hostname).to match 'http://localhost'
		expect(proxy.port).to eq 9050
	end

	it "#to_s" do
		proxy = Proxy.new({hostname: 'http://localhost', port: 9050})
		expect(proxy.to_s).to match 'http://localhost:9050'
	end

	it "#running?" do
		proxy = Proxy.new({hostname: 'http://localhost', port: 9050})
		expect(proxy.running?).to be Tool.new().tor_running?
	end
end