require 'simplecov'
SimpleCov.start

require "./course.rb"
require "./chromosome.rb"
require "./generation.rb"
require "test_notifier/runner/rspec"
require 'csv'

RSpec.configure do |config|

	config.color_enabled = true

	config.full_backtrace = true

end

