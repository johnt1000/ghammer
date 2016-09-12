# encoding: UTF-8

class Config
  attr_accessor :env
  attr_accessor :path
  attr_accessor :params
  attr_accessor :yml

  def initialize(options = {})
    self.env = options.fetch(:env, 'production')
    self.path = options.fetch(:path, File.join(APP_ROOT, "config"))
  end

  def loading
    if self.file_exists?
      self.params = YAML.load_file(self.yml.to_s)
    else
      self.params = nil
    end
  end

  def file_exists?
    file ="#{self.env}.yml"
    self.yml = File.join(self.path, file)
    File.exist?(self.yml.to_s)
  end
end