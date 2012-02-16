class Course

	attr_accessor :id, :teacher, :name, :weekDay, :students
	def initialize id, teacher, name, students
		@id = id
		@teacher = teacher
		@name = name
		@weekDay = genWeekDay
		@students = students
	end

	def genWeekDay
		1+rand(4)
	end

	def genWeekDay!
		@weekDay = genWeekDay
	end

	def to_a
		Array[@id, @teacher, @name, @students, @weekDay]
	end
end