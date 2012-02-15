require "spec_helper"

describe Chromosome do
	subject { Chromosome.new "turmas.csv"}

	describe "#new" do		
		it "Should be an isntance of Chromosome" do
			subject.should be_an(Chromosome)
		end

		it "Should have corredt file name" do
			subject.file.should be == "turmas.csv"
		end
		
		it "Should have an array of courses" do
			subject.courses.should have(143).Courses
		end

		it "Should return the correct Course data" do
			course = Course.new 5, "ERNEST Babbitt", "Banco de Dados", 63
			course2 = subject.findCourse(5)
			course2.id.should == course.id
			course2.name.should == course.name
			course2.teacher.should == course.teacher
			course2.students.should == course.students
		end

		it "Should have a fitness" do
			subject.fitness.should be_an(Integer)
			subject.fitness.should >= 0
		end
	end 

	describe "#procriate" do
		it "Should recieve a Chromosome as parameter and return a third chromosome" do
			chrom2 = Chromosome.new "turmas.csv"
			chrom3 = subject.procriate chrom2
			chrom3.courses[0].should_not be_equal chrom2.courses[0]
			chrom3.courses[0].should_not be_equal subject.courses[0]
		end
	end

	describe "#getWeekDayFitness" do
		it "Should return the difference between the day with less courses to the day with more courses" do
			subject.courses = subject.courses.take(5)
			subject.courses[0].weekDay = 0
			subject.courses[1].weekDay = 0
			subject.courses[2].weekDay = 0
			subject.courses[3].weekDay = 2
			subject.courses[4].weekDay = 2
			subject.courses.each { |course| course.students = 10 }
			subject.getWeekDayFitness.should == 30

			subject.courses[3].weekDay = 0
			subject.getWeekDayFitness.should == 40
		end
	end

	describe "#getTeacherFitness" do
		it "Should return the number of courses in the same weekDay that has the same teacher" do
			subject.courses = subject.courses.take(5)
			subject.courses[0].weekDay = 5
			subject.courses[1].weekDay = 3
			subject.courses[2].weekDay = 3
			subject.courses[3].weekDay = 5
			subject.courses[4].weekDay = 5

			subject.courses[0].teacher = "fulano"
			subject.courses[1].teacher = "fulano"
			subject.courses[2].teacher = "fulano"
			subject.courses[3].teacher = "fulano"
			subject.courses[4].teacher = "fulano"

			subject.getTeacherFitness.should == 3
		end
	end

	describe "#getFitness" do
		it "Should return the correct fitness of the chromosome" do
			subject.courses = subject.courses.take(5)
			subject.courses[0].weekDay = 1
			subject.courses[1].weekDay = 2
			subject.courses[2].weekDay = 2
			subject.courses[3].weekDay = 1
			subject.courses[4].weekDay = 2

			subject.courses.each { |course| course.students = 10 }

			subject.courses[0].teacher = "fulano"
			subject.courses[1].teacher = "fulano"
			subject.courses[2].teacher = "ciclano"
			subject.courses[3].teacher = "fulano"
			subject.courses[4].teacher = "fulano"

			subject.getFitness.should == 2030
		end
	end

	describe "#mutate" do
		it "Should mutate some courses of the chromosome" do
			fitness = subject.fitness
			subject.mutate!
			subject.getFitness!
			subject.fitness.should_not == fitness
		end
	end
end		