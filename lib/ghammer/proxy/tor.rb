# encoding: UTF-8
require File.join(File.dirname(__FILE__), '..', 'config')

module Tor
  def installed?
    stdop = system("tor --version > /dev/null")
    result = $?
    exit_code = result.exitstatus 
    return !exit_code.eql?(127)
  end
  
  def install
    system("sudo apt-get install tor")
  end

  def running?
    system("pidof tor > /dev/null")
  end

  def renew
    system("[ -z 'pidof tor' ] || pidof tor | xargs sudo kill -HUP;")
    sleep 1
  end
end