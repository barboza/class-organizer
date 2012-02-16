require 'simplecov'
SimpleCov.start

require "./lib/course.rb"
require "./lib/chromosome.rb"
require "./lib/generation.rb"
require 'csv'

RSpec.configure do |config|

	config.color_enabled = true

	config.full_backtrace = true

end

