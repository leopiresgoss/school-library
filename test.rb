# Run this file using the IRB or by "ruby test.rb"

require_relative 'classroom'
require_relative 'student'
require_relative 'rental'
require_relative 'book'

classroom = Classroom.new('MATH-1A')
puts classroom.label
# => Math-1A

puts classroom.students
# =>

maria = Student.new(16, 'Maria')
jonas = Student.new(15, 'Jonas', parent_permission: false)

classroom.add_student(maria)
classroom.add_student(jonas)

classroom.students.each { |student| puts "#{student.name} - #{student.classroom.label}" }
# => Maria - MATH-1A
# => Jonas - MATH-1A

book1 = Book.new('Percy Jackson & the Olympians', 'Rick Riordan')
book2 = Book.new('The Lord of the Rings', 'J. R. R. Tolkien')

book1.add_rental('2021/05/03', maria)
jonas.add_rental('2021/12/02', book1)
maria.add_rental('2021/07/07', book2)
book2.add_rental('2021/11/12', jonas)

book1.rentals.each { |rental| puts "rental: #{rental.date} - #{rental.book.title} by #{rental.person.name}" }
# => rental: 2021/05/03 - Percy Jackson & the Olympians by Maria
# rental: 2021/12/02 - Percy Jackson & the Olympians by Jonas

maria.rentals.each { |rental| puts "rental: #{rental.date} - #{rental.book.title}" }
# => rental: 2021/05/03 - Percy Jackson & the Olympians
# => rental: 2021/07/07 - The Lord of the Rings
