require "./lib/course.rb"
require "./lib/chromosome.rb"
require "./lib/generation.rb"
require 'csv'

generation = Array[]
generation << Generation.new
1000.times do |x|
	actualGen = generation.last
	actualGen.procriate
	actualGen.mutate!	
	puts actualGen.getBestFitness
	generation << Generation.new(actualGen.getNextGenChromosomes)
end
actualGen = generation.last
actualGen.procriate
actualGen.mutate!
puts actualGen.getBestFitness