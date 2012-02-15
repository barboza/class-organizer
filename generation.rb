class Generation
	attr_accessor :fathers, :sons

	def initialize fathers = nil
		@fathers = fathers ? fathers : Array.new(200){ Chromosome.new "turmas.csv"}
	end

	def procriate
		@sons = Array[]
		@fathers.sort_by! { |chromosome| chromosome.fitness }
		@fathers = @fathers.take(120)
		@fathers.each_index do |index|
			@sons << (index.even? ? @fathers[index].procriate(@fathers[index+1]) : @fathers[index].procriate(@fathers[index-1])) 
		end
		@sons
	end

	def mutate!
		randomArray = Array.new(rand(120)) { rand(120) }
		randomArray.each do |x|
			@sons[x].mutate!
			@sons[x].getFitness!
		end
	end

	def getNextGenChromosomes
		@fathers.sort_by! { |chromosome| chromosome.fitness }
		(@sons+@fathers.take(80)).shuffle
	end

	def getBestFitness
		@fathers.sort_by! { |chromosome| chromosome.fitness }
		(@sons+@fathers.take(80)).sort_by! { |chromosome| chromosome.fitness }.first.fitness
	end
end
