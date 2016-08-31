class Tool
  def my_ip
    c = Curl::Easy.perform("https://api.ipify.org")
    puts c.body_str
  end
  
  def curl_installed?
    stdop=system("curl --version > /dev/null")
    result=$?
    exit_code=result.exitstatus 
    return !exit_code.eql?(127)
  end
  
  def curl_install
    system("sudo apt-get install libcurl3 libcurl3-gnutls libcurl4-openssl-dev")
  end
end