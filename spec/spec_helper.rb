require 'bundler/setup'
Bundler.setup

require 'factory_girl_json_api'
require 'factory_girl'
require 'active_support'

Dir['./spec/factories/**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

module FactoryGirl
  include FactoryGirlJsonApi::FactoryGirlExtension
end
