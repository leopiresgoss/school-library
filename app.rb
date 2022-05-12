require './book'
require './student'
require './teacher'

class App
  def initialize
    @options = ['List all books', 'List all people', 'Create a person', 'Create a book',
                'Create a rental', 'List all rentals for a given person id', 'Exit']
    @books = []
    @students = []
    @teachers = []
  end

  def run
    display_options
  end

  def display_options
    puts ''
    puts 'Please, choose an option by entering a number:'
    @options.each_with_index { |option, index| puts "#{index + 1} - #{option}" }
    select_option
  end

  def select_option
    option = gets.chomp.to_i
    case option
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_person
    when 4
      create_book
    when 7
      puts 'Thanks you for using this app!'
    else
      display_options
    end
  end

  def list_all_books
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    display_options
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
    display_options
  end

  def create_person
    print 'Do you want to create a student (1) or a techer (2) [Input the number]:'
    input = gets.chomp.to_i
    case input
    when 1
      @students << add_student
    when 2
      @teachers << add_teacher
    else
      create_person
    end
    puts 'Person created successfully!'
    display_options
  end

  def list_all_people
    @students.each { |student| puts "[Student] Name: #{student.name}, ID: #{student.id}, Age: #{student.age}" }
    @teachers.each { |teacher| puts "[Teacher] Name: #{teacher.name}, ID: #{teacher.id}, Age: #{teacher.age}" }
    display_options
  end

  def add_student
    print 'Age: '
    age = gets.chomp.to_i

    # in case of additing a str instead of number
    if age.zero?
      puts 'Invalid age'
      add_student
    end

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [y/n]: '
    input_permission = gets.chomp.upcase

    parent_permission = input_permission == 'Y'

    Student.new(age, name, parent_permission: parent_permission)
  end

  def add_teacher
    print 'Specialization: '
    specialization = gets.chomp

    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    Teacher.new(specialization, age, name)
  end
end
