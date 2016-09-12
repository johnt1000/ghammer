# encoding: UTF-8

require "spec_helper"
require 'yaml'
require "./lib/ghammer/config"

describe Config, "using config/*.yml file" do
  context 'Nit when the configuration file exists' do
    before { @config = Config.new({env: 'development'}) } # setup
    
    it "#initialized" do
      # exercise / verify
      expect(@config.env).to match /development/
      expect(@config.path).to match /config/
    end
    
    it "#file_exists?" do
      # exercise / verify
      expect(@config.file_exists?).to be false
    end
    
    it "#loading" do
      # exercise
      @config.loading
      # verify
      expect(@config.params.nil?).to be true
    end
  end
  
  context "context for production" do
    before { @config = Config.new({env: 'production'}) } # setup
    
    it "#initialized" do
      # exercise / verify
      expect(@config.env).to match "production"
      expect(@config.path).to match "config"
    end

    it "#file_exists?" do
      # exercise / verify
      expect(@config.file_exists?).to be true
      expect(@config.yml.to_s).to match '../../config/production.yml'
    end

    it "#loading" do
      # exercise
      @config.loading
      # verify
      expect(@config.params.nil?).to be false
    end
  end
  
  context "context for tests" do
    before { @config = Config.new({env: 'test'}) } # setup
    
    it "#initialized" do
      # exercise / verify
      expect(@config.env).to match "test"
      expect(@config.path).to match "config"
    end

    it "#file_exists?" do
      # exercise / verify
      expect(@config.file_exists?).to be true
      expect(@config.yml.to_s).to match '../../config/test.yml'
    end

    it "#loading" do
      # exercise
      @config.loading
      # verify
      expect(@config.params.nil?).to be false
      expect(@config.params['target']).to match 'http://testphp.vulnweb.com'
      expect(@config.params['verbose']).to be false
      expect(@config.params['debug']).to be false
      expect(@config.params['dork']['directory']).to match 'spec/dorks_test'
      expect(@config.params['proxy']['use']).to be false
      expect(@config.params['proxy']['hostname']).to match 'http://localhost'
      expect(@config.params['proxy']['port']).to eq 9050
      expect(@config.params['output']['directory']).to match 'spec/output_test'
      expect(@config.params['search']['persist']['number']).to eq 5
      expect(@config.params['search']['result']['per_page']).to eq 1500
      expect(@config.params['query']['delay']).to eq 1.5
      expect(@config.params['query']['verbose']).to be false
    end
  end
end