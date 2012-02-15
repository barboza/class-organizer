class Chromosome
	
	attr_accessor :file, :courses, :fitness
	def initialize file
		@file = file
		@courses = Array.new
		CSV.foreach(file, :col_sep => ';') do |row|
			@courses << (Course.new row[0].to_i, row[1], row[2], row[3].to_i)
		end
		@courses.shuffle!
		@fitness = getFitness
	end

	def procriate chromosome
		chromosome2 = chromosome.clone
		chromosome2.courses = chromosome2.courses.map{|course| course.clone }
		@courses.each do |course|
			chromosome2.courses[courses.index(course)].weekDay = course.weekDay
		end
		chromosome2.getFitness!		
		chromosome2
	end

	def findCourse id
		@courses[@courses.index{|course| course.id == id}]
	end

	def getFitness
		getWeekDayFitness + getTeacherFitness*1000
	end

	def getFitness!
		@fitness = getFitness
	end

	def getWeekDayFitness
		weekDays = Array.new(5, 0)
		@courses.each {|course| weekDays[course.weekDay-1] += course.students}
		weekDays.sort!
		weekDays.last - weekDays.first
	end

	def getTeacherFitness
		weekDays = Array.new(5) { |weekDay| (@courses.select{ |course| course.weekDay == weekDay+1 }).map{ |course| course.teacher } }
		array = weekDays.map { |weekDay| weekDay.count }
		uniqueArray = weekDays.map { |weekDay| weekDay.uniq.count }
		fitness = 0
		array.each_index { |weekDay| fitness += array[weekDay]-uniqueArray[weekDay] }
		fitness
	end

	def mutate!
		randomArray = Array.new(rand(courses.count)) { rand(courses.count) }
		randomArray.each do |x|
			@courses[x].genWeekDay!
		end
	end
end