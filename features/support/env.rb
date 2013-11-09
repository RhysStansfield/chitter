# Generated by cucumber-sinatra. (2013-11-09 20:05:52 +0000)

ENV['RACK_ENV'] = 'test'

require './server'

require File.join(File.dirname(__FILE__), '..', '..', 'lib/chitter.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

require 'database_cleaner'
require 'database_cleaner/cucumber'

Capybara.app = Chitter
DatabaseCleaner.strategy = :truncation

class ChitterWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  ChitterWorld.new
end

Before do
  DatabaseCleaner.start
  Post.create(body: 'Awesome post!',
    user: 'Derp',
    time: Time.now)
  Post.create(body: 'Sahwheat!',
    user: 'Doink',
    time: Time.now)
end

After do |scenario|
  DatabaseCleaner.clean
end