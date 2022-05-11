# Run this file using the IRB or by "ruby app.rb"

require_relative 'classroom'
require_relative 'student'

classroom = Classroom.new('MATH-1A')
puts classroom.label
# => Math-1A

puts classroom.students
# =>

maria_student = Student.new(classroom, 16, 'Maria')
classroom.add_student(maria_student)

jonas_student = Student.new(classroom, 15, 'Jonas', parent_permission: false)
classroom.add_student(jonas_student)

classroom.students.each { |student| puts student.name }
# => Maria, Jonas
