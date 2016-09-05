# encoding: UTF-8

require "spec_helper"
require 'yaml'
require "./lib/ghammer/config"

describe Config  do
	describe "#initialized" do
		it "empty instance" do
			c = Config.new

			expect(c.env).to match "production"
      # TODO Regex
      expect(c.path).to match "/vagrant/workspace/ghammer_tcc/lib/ghammer/../config"
		end
	end

  describe "#file_exists?" do
    it "true" do
      c = Config.new
      c.loading

      expect(c.file_exists?).to be true
    end

    it "false" do
      c = Config.new({env: 'test'})
      c.loading

      expect(c.file_exists?).to be false
    end
  end

  describe "#loading" do
    it "file exists" do
      c = Config.new
      c.loading

      expect(c.params.nil?).to be false
    end

    it "file not exists" do
      c = Config.new({env: 'test'})
      c.loading
      
      expect(c.params.nil?).to be true
    end
  end
end