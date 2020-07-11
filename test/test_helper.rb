ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
require 'simplecov-cobertura'
SimpleCov.formatter = SimpleCov::Formatter::CoberturaFormatter
SimpleCov.start 'rails'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::JUnitReporter.new

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  # disable parallel test because simplecov issue.
  # see. https://github.com/colszowka/simplecov/issues/718
  # parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
