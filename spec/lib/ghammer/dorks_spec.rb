# encoding: UTF-8

require "spec_helper"
require "./lib/ghammer/expr"
require "./lib/ghammer/dork"
require "./lib/ghammer/dorks"

describe Dorks, 'whenever used' do
  before do
    @dorks = Dorks.new

    @expr1 = {"type": "inurl", "value": "phpinfo",
              "quoted": false, "suppress":  nil,
              "synonyms":  nil}
    @expr2 = {"type": "text", "value": "PHP Version",
              "quoted": true, "suppress":  nil,
              "synonyms":  nil}
  end
  
  it "#loading" do
    @dorks.loading
    
    # verify
    expect(@dorks.result.first.title).to match(/PHP Info/)
    expect(@dorks.result.first.description).to match(/Page PHP containing info server./)
    expect(@dorks.result.first.category).to match(/Server/)
    expect(@dorks.result.first.category_child).to match(/Pages containing info server/)
    expect(@dorks.result.first.author).to match(/Jônatas Rodrigues/)
    expect(@dorks.result.first.md5).to match(/9e44f50b6a5f1beab603a16bb6205358/)
    expect(@dorks.result.first.version).to eq(1.0)
    expect(@dorks.result.first.deprecated).to be false
    expect(@dorks.result.first.expr.length).to eq(2)
    expect(@dorks.result.first.expr.first).to be_a(Expr)
    expect(@dorks.result.first.expr.first).to have_attributes(@expr1)
    expect(@dorks.result.first.expr.last).to be_a(Expr)
    expect(@dorks.result.first.expr.last).to have_attributes(@expr2)
  end
end