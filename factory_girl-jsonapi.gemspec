# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'factory_girl-jsonapi/version'

Gem::Specification.new do |gem|
  gem.name          = 'factory_girl-jsonapi'
  gem.version       = FactoryGirl::Jsonapi::VERSION
  gem.authors       = ['Denis Talakevich']
  gem.email         = ['senid231@gmail.com']

  gem.summary       = 'Generate body in JSON API standard'
  gem.description   = 'Add ability to generate JSON API request/response body'\
                      ' with FactoryGirl'
  gem.homepage      = 'https://github.com/senid231/factory_girl-jsonapi'

  gem.files         = `git ls-files`.split($RS)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'factory_girl'
  gem.add_dependency 'activesupport'

  gem.add_development_dependency 'rspec', '>= 2.0.0'
  gem.add_development_dependency 'rake', '~> 10.0'
end
