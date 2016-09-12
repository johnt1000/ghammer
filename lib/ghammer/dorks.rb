# encoding: UTF-8

class Dorks
	
  attr_accessor :result

  def initialize(options = {})
    self.result = []
  end

  def loading
    self.result.clear
    # loading
    Dir[File.join(APP_ROOT, CONFIG.dork_directory, '*.json')].each do |file|
      # file
      obj_file = File.read(file)
      # json
      json = JSON.parse(obj_file, { symbolize_names: true })
      # obj dork
      dork = Dork.new(json)
      # populate result
      self.result.push(dork)
    end
  end

  def rm(md5)
    if exist?(md5)
      FileUtils.rm(File.join(APP_ROOT, CONFIG.dork_directory, "#{md5}.json"))
      true
    else
      false
    end
  end

  def exist?(md5)
    File.exist?(File.join(APP_ROOT, CONFIG.dork_directory, "#{md5}.json"))
  end

  def add
    
  end

  def exist?(md5)
    File.exist?(File.join(APP_ROOT, CONFIG.dork_directory, "#{md5}.json"))
  end
end