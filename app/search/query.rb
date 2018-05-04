# encoding: UTF-8

class Query

  def initialize(url, options = {})
    @cmd = Curl::Easy.new(url)
    @cmd.headers["User-Agent"] = Agent.new().to_s
    @cmd.headers["Referer"] = Referer.new().to_s

    @verbose = options.fetch(:verbose, CONFIG.yml['query']['verbose'])
    @delay = options.fetch(:delay, CONFIG.yml['query']['delay'])
    @proxy_use = options.fetch(:proxy_use, CONFIG.yml['proxy']['use'])
  end
  
  def result
    run
    { status: @status, body: @cmd.body_str }
  end
  
  private
    def run
      begin
        sleep @delay
        if @proxy_use == true
          # proxy configuration
          @cmd.proxy_url = CONFIG.yml['proxy']['hostname']
          @cmd.proxy_port = CONFIG.yml['proxy']['port']
          @cmd.proxy_type = Curl::CURLPROXY_SOCKS5
          @cmd.proxy_tunnel = true
          @cmd.ssl_verify_peer = false
          @cmd.ssl_verify_host = false
        end
        @cmd.verbose = @verbose
        @cmd.perform
        
        @status = {success: @cmd.status}
        
        return true
      rescue  => e
        @status = {error: "#{e}"}
        return false
      end
    end
end