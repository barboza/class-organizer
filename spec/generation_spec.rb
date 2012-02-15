require "spec_helper"

describe Generation do
	subject { Generation.new }
	describe "#new" do
		it "Should be an instance of generation" do
			subject.should be_an(Generation)
		end

		it "Should have fathers" do
			subject.fathers.should have(200).Chromosomes
		end
	end

	describe "#procriate" do
		it "Should return an Array with the sons of the best 120 fathers" do
			subject.procriate.should have(120).Chromosomes
		end
	end

	describe "#mutate" do
		it "should mutate some chromosomes" do
			subject.procriate
			fitness = 0
			subject.sons.each do |chromosome|
				fitness += chromosome.fitness
			end

			subject.mutate!

			fitness2 = 0
			subject.sons.each do |chromosome|
				fitness2 += chromosome.fitness
			end

			fitness.should_not == fitness2
		end
	end

	describe "#getNextGenChromosomes" do
		it "Should return an array of Chromosomes" do
			subject.procriate
			subject.mutate!
			subject.getNextGenChromosomes.should have(200).Chromosomes
		end
	end

end