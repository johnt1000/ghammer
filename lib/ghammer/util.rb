class Util
  attr_accessor :config

  def load_config name
    if file_exists? name
      @config = YAML.load_file(@file.to_s)
    end
  end

  def file_exists? name
    file_name ="#{name}.yml"
    @file = File.join( File.join(File.dirname(__FILE__), '..', '..', 'config', 'repo'), file_name )
    File.exist?(@file.to_s)
  end
end
