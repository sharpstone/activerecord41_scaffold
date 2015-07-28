require 'active_record'
require 'yaml'
require 'erb'
ActiveRecord::Base.configurations = YAML.load(ERB.new(File.read("config/database.yml")).result) || {}

run proc {|env| [200, {'Content-Type' => 'text/plain'}, ["#{ActiveRecord::Base.establish_connection;ActiveRecord::Base.connection_pool.instance_eval { @size }}"]] }
