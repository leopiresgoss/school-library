require './book'
require './student'
require './teacher'

class App
  def initialize
    @options = ['List all books', 'List all people', 'Create a person', 'Create a book',
                'Create a rental', 'List all rentals for a given person id', 'Exit']

    @books = []
    @people = []

    @options_obj = {
      1 => -> { list_all_books },
      2 => -> { list_all_people },
      3 => -> { create_person },
      4 => -> { create_book },
      5 => -> { create_rental },
      6 => -> { list_all_rentals }
    }
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

    if option == 7
      puts 'Thank you for using this app!'
    else
      @options_obj[option]&.call
      display_options
    end
  end

  def list_all_books
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  def create_person
    print 'Do you want to create a student (1) or a techer (2) [Input the number]:'
    input = gets.chomp.to_i
    case input
    when 1
      @people << add_student
    when 2
      @people << add_teacher
    else
      create_person
    end
    puts 'Person created successfully!'
  end

  def list_all_people
    @people.each do |person|
      puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
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

    if age.zero?
      puts 'Invalid age'
      add_teacher
    end

    print 'Name: '
    name = gets.chomp

    Teacher.new(specialization, age, name)
  end

  def create_rental
    if @books.length.zero? || @people.length.zero?
      puts 'Books or person not found, add them first before creating a rental'
      return
    end

    book = select_book
    person = select_person

    unless person && book
      puts 'Invalid value for book or person, try again'
      return
    end

    print 'Date: '
    date = gets.chomp

    person.add_rental(date, book)
    puts 'Rental created successfully'
  end

  def select_book
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, i| puts "#{i}) Title: \"#{book.title}\", Author: #{book.author}" }
    index = gets.chomp.to_i
    @books[index]
  end

  def select_person
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, i|
      puts "#{i}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    index = gets.chomp.to_i
    @people[index]
  end

  def list_all_rentals
    print 'ID of a person '
    id = gets.chomp.to_i

    person = @people.find { |p| id == p.id }

    unless person
      puts 'Person not found'
      return
    end

    person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end
