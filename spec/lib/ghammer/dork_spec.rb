# encoding: UTF-8

require "spec_helper"
require "./lib/ghammer/dork"
require "./lib/ghammer/expr"

describe Dork, 'whenever used' do
  before do
    # setup
    @expr1 = {
      type: 'text',
      value: 'sandu ixiixiiixiiii',
      quoted: true,
      suppress: ['ketchup'],
      synonyms: ['sanduíche']
    }
    @expr2 = {
      type: 'intitle',
      value: 'entrevista'
    }
    @opts = {
      title: 'Title',
      description: 'Description',
      category: 'General',
      category_child: 'General Child',
      author: 'Author',
      version: 1.0,
      deprecated: false,
      expr: [@expr1, @expr2]
    }
    @dork = Dork.new @opts
  end
  
  it "#initialized" do
    # verify
    expect(@dork.title).to match(/Title/)
    expect(@dork.description).to match(/Description/)
    expect(@dork.category).to match(/General/)
    expect(@dork.category_child).to match(/General Child/)
    expect(@dork.author).to match(/Author/)
    expect(@dork.version).to eq(1.0)
    expect(@dork.deprecated).to be false
    expect(@dork.expr.length).to eq(2)
    expect(@dork.expr.first).to be_a(Expr)
    expect(@dork.expr.first).to have_attributes(@expr1)
    expect(@dork.expr.last).to be_a(Expr)
    expect(@dork.expr.last).to have_attributes(@expr2)
  end
  
  it "#add_expr" do
    # setup
    expr3 = {
      type: 'inurl',
      value: 'youtube'
    }
    # exercise
    @dork.add_expr [expr3]
    # verify
    expect(@dork.expr.last).to be_a(Expr)
    expect(@dork.expr.last).to have_attributes(expr3)
  end
  
  it "#uri" do
    expect(@dork.uri).to match("%22sandu+ixiixiiixiiii%22+-ketchup+~sandu%C3%ADche+intitle:entrevista")
  end
  
  it "#to_s" do
    expect(@dork.to_s).to match('"sandu ixiixiiixiiii" -ketchup ~sanduíche intitle:entrevista')
  end
end