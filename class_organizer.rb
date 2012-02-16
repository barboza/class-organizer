require "./lib/course.rb"
require "./lib/chromosome.rb"
require "./lib/generation.rb"
require 'csv'
require 'time'

ARGV[0] = ARGV[0] ? ARGV[0].to_i : 10

start = Time.now
generation = Generation.new
ARGV[0].times do |x|
	last = last ? Time.now-last	: Time.now
	actualGen = generation
	actualGen.procriate
	actualGen.mutate!
	generation == Generation.new(actualGen.getNextGenChromosomes)
	puts "Generation #{x} - Fitness #{actualGen.getBestFitness} - in #{Time.now-last.round(5)} sec"
end
actualGen = generation
actualGen.procriate
actualGen.mutate!
puts "Final generation - Fitness #{actualGen.getBestFitness} - Total exec time #{Time.now-start.round(5)} seconds"
courses = actualGen.getBestChromosome
CSV.open("result.csv", "wb", :col_sep => ';') do |csv|
	courses.each do |course|
		csv << course.to_a
	end
end
puts 'Results can be found in "result.csv"'

