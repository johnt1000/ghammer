# encoding: UTF-8

require "spec_helper"
require 'yaml'
require "./lib/ghammer/config"

describe Config  do
	describe "#initialized" do
		it "empty instance" do
			c = Config.new

			expect(c.env).to match "production"
      expect(c.path).to match "config"
		end
    it "set options" do
      c = Config.new({ env: 'development', path: '/var/shared/config' })

      expect(c.env).to match /development/
      expect(c.path).to match "/var/shared/config"
    end
	end

  describe "#file_exists?" do
    it "true" do
      c = Config.new
      expect(c.file_exists?).to be true
      expect(c.yml.to_s).to match '../../config/production.yml'
    end

    it "false" do
      c = Config.new({env: 'development'})
      expect(c.file_exists?).to be false
      expect(c.yml.to_s).to match '../../config/development.yml'
    end
  end

  it "#loading" do
    c = Config.new
    c.loading

    expect(c.params.nil?).to be false
  end
end