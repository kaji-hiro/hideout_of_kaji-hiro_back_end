require 'simplecov'
SimpleCov.start 'rails' do
  enable_coverage :branch
  add_filter '/job'
  add_filter do |source_file|
    source_file.lines.count < 5
  end
  minimum_coverage line: 100, branch: 100
end

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  # parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
