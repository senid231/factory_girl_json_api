require 'bundler/setup'
Bundler.setup

require 'factory_girl-jsonapi'
require 'factory_girl'
require 'active_support'

Dir['./spec/factories/**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
