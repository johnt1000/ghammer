# encoding: UTF-8

require "spec_helper"
require "./lib/ghammer/expr"

describe Expr, 'whenever used' do
  it "#initialized" do
    # setup
    opts = {
      type: 'text',
      value: 'sandu ixiixiiixiiii',
      quoted: true,
      suppress: ['ketchup'],
      synonyms: ['sanduíche']
    }
    expr = Expr.new(opts)
    
    #verify
    expect(expr).to have_attributes(opts)
  end

  it "#decode" do
    # setup
    opts = {
      type: 'inurl',
      value: 'installer-log.txt',
      quoted: true,
      suppress: ['file', 'abc'],
      synonyms: ['install', 'installed']
    }

    expr = Expr.new opts

    expect(expr.decode).to eq('inurl:"installer-log.txt" -file -abc ~install ~installed')
  end
end