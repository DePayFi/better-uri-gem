$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'better_uri/version'

Gem::Specification.new do |s|
  s.name        = 'better_uri'
  s.version     = BetterUri::VERSION
  s.authors     = ['https://github.com/depayfi/better_uri/graphs/contributors']
  s.email       = ['engineering@depay.fi']
  s.homepage    = 'https://github.com/depayfi/better_uri'
  s.summary     = "Better URI gem to improve Ruby's URI (Uniform Resource Identifiers) core module."
  s.description = "Better URI gem to improve Ruby's URI (Uniform Resource Identifiers) core module."
  s.files       = Dir['{lib}/**/*', 'README.md']

  s.add_dependency 'activesupport'
  s.add_dependency 'rack'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rubocop-rspec'
end
