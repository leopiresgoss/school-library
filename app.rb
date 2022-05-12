# Run this file using the IRB or by "ruby app.rb"

require_relative 'classroom'
require_relative 'student'

classroom = Classroom.new('MATH-1A')
puts classroom.label
# => Math-1A

puts classroom.students
# =>

Student.new(classroom, 16, 'Maria')

Student.new(classroom, 15, 'Jonas', parent_permission: false)

classroom.students.each { |student| puts student.name }
# => Maria, Jonas
