require "spec_helper"

describe Course do

	subject { @course = Course.new 0, "Rafael barboza", "Testes em ruby", 30 }

	describe "#new" do

		it "Should take five parameters and returns a Course object" do
			subject.should be_an_instance_of Course
		end
		
		it "Should returns the correct ID" do
			subject.id.should be == 0
		end
	
		it "Should returns the correct teacher" do
			subject.teacher.should be == "Rafael barboza"
		end
	
		it "Should returns the correct name" do
			subject.name.should be == "Testes em ruby"
		end
	
		it "Should returns a random week day within 1 and 5" do
			subject.weekDay.should satisfy{ |n| 0 < n && n < 6 }
		end

		it "Should returns the correct number of students" do
			subject.students.should be == 30
		end
	end

	describe "#genWeekDay" do
		it "Should return a random number within 1 and 5" do
			20.times do
				subject.genWeekDay.should be_between(1,5)
			end
		end
	end
end