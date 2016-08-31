# encoding: UTF-8

class Tool
  def my_ip
    c = Curl::Easy.perform("https://api.ipify.org")
    puts c.body_str
  end
  
  def my_ip_tor
    q = Query.new("https://api.ipify.org", true)
    #puts q.to_s
    q.run
    puts q.result
  end

  def curl_installed?
    stdop = system("curl --version > /dev/null")
    result = $?
    exit_code = result.exitstatus 
    return !exit_code.eql?(127)
  end
  
  def curl_install
    system("sudo apt-get install curl libcurl3 libcurl3-gnutls libcurl4-openssl-dev")
  end

  def tor_installed?
    stdop = system("tor --version > /dev/null")
    result = $?
    exit_code = result.exitstatus 
    return !exit_code.eql?(127)
  end
  
  def tor_install
    system("sudo apt-get install tor")
  end

  def tor_running?
    system("pidof tor > /dev/null")
  end
end