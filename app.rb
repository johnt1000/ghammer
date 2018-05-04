# gems
require "rubygems"
require "thor"
require 'terminal-table'
require 'i18n'
require 'yaml'
require 'json'
require 'uri'
require 'highline'
require 'highline/import'
require 'curb'
require 'sqlite3'
require 'active_record'

Dir.glob("./app/models/*.rb").sort.each do |file|
  require file
end

Dir.glob("./app/*.rb").sort.each do |file|
  require file
end

Dir.glob("./app/dork/*.rb").sort.each do |file|
  require file
end

Dir.glob("./app/proxy/*.rb").sort.each do |file|
  require file
end

Dir.glob("./app/search/*.rb").sort.each do |file|
  require file
end

class App
  # Configure ActiveRecord
  env    = ENV['ENV'] || 'development'
  root   = File.expand_path '..', __FILE__
  database = YAML.load(File.read(File.join(root, 'config/database.yml')))

  CONFIG = Config.new(env: 'development')

  ActiveRecord::Base.configurations = database
  ActiveRecord::Base.establish_connection env.to_sym
  ActiveRecord::Base.logger = Logger.new(File.open("#{root}/log/database.log", 'a'))
end
CONFIG = Config.new(env: 'development')
