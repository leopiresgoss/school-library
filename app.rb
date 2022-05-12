# Run this file using the IRB or by "ruby app.rb"

require_relative 'classroom'
require_relative 'student'
require_relative 'rental'
require_relative 'book'

classroom = Classroom.new('MATH-1A')
puts classroom.label
# => Math-1A

puts classroom.students
# =>

maria = Student.new(classroom, 16, 'Maria')

jonas = Student.new(classroom, 15, 'Jonas', parent_permission: false)

classroom.students.each { |student| puts student.name }
# => Maria, Jonas

book1 = Book.new('Percy Jackson & the Olympians', 'Rick Riordan')
book2 = Book.new('The Lord of the Rings', 'J. R. R. Tolkien')

Rental.new('2021/05/03', maria, book1)
Rental.new('2021/12/02', jonas, book1)
Rental.new('2021/07/07', maria, book2)
Rental.new('2021/11/12', jonas, book2)

book1.rentals.each { |rental| puts "rental: #{rental.date} - #{rental.book.title} by #{rental.person.name}" }
# => rental: 2021/05/03 - Percy Jackson & the Olympians by Maria
# rental: 2021/12/02 - Percy Jackson & the Olympians by Jonas

maria.rentals.each { |rental| puts "rental: #{rental.date} - #{rental.book.title}" }
# => rental: 2021/05/03 - Percy Jackson & the Olympians
# => rental: 2021/07/07 - The Lord of the Rings
