# encoding: UTF-8

require "spec_helper"
require "./lib/ghammer/banner"

describe Banner  do
	it "#initialized" do
		a = Banner.new

		expect(a.banner.nil?).to be false
		expect(a.banner.length).to be > 10
	end
end