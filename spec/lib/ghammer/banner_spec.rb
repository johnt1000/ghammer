# encoding: UTF-8

require "spec_helper"
require "./lib/ghammer/banner"

describe Banner, 'whenever used' do
  
  before do
    # setup
    @banner_obj = Banner.new
    @banner_str_01 =
    """
    _______ _______                                     
   |     __|   |   |.---.-.--------.--------.-----.----.
   |    |  |       ||  _  |        |        |  -__|   _|
   |_______|___|___||___._|__|__|__|__|__|__|_____|__| 
    """
    @banner_str_x =
    """
    ___oooo___oo____oo_____________________________________________
    _oo____oo_oo____oo__ooooo__oo_oo_oo__oo_oo_oo___ooooo__oo_ooo__
    oo________oo____oo_oo___oo_ooo_oo__o_ooo_oo__o_oo____o_ooo___o_
    oo____ooo_oooooooo_oo___oo_oo__oo__o_oo__oo__o_ooooooo_oo______
    _oo____oo_oo____oo_oo___oo_oo__oo__o_oo__oo__o_oo______oo______
    ___oooo___oo____oo__oooo_o_oo______o_oo______o__ooooo__oo______
    _______________________________________________________________
    """
  end
  
  it "#initialized" do
    # exercise / verify
    expect(@banner_obj.banner.nil?).to be false
    expect(@banner_obj.banner.count).to eq 55
    expect(@banner_obj.banner).to start_with(@banner_str_01)
    expect(@banner_obj.banner).to include(@banner_str_x)
    expect(@banner_obj.banner).to all(be_a(String))
  end
  
  it "#to_s" do
    # exercise
    str = @banner_obj.to_s
    # verify
    expect(str).to be_a(String)
    expect(str.length).to be > 10
  end
end