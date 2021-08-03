# frozen_string_literal: true

require 'active_record'
require 'validates-correios-cep'

ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'
load "#{ File.dirname(__FILE__) }/schema.rb"

Dir['./spec/models/*.rb'].each { |file| require file }
Dir['./spec/poros/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
