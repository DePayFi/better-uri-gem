# frozen_string_literal: true

# this file should not be included on its own.
# the .rspec file makes sure that the rails_helper is included by default
require 'pry'
require 'better_uri'
Dir[File.join(__dir__, 'support/**/*.rb')].each { |f| require f }

define_method(:URI, ->(string) { BetterUri::URI.new(string) })

RSpec.configure do |config|
end
