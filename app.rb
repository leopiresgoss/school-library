require './book'

class App
  def initialize
    @options = ['List all books', 'List all people', 'Create a person', 'Create a book',
                'Create a rental', 'List all rentals for a given person id', 'Exit']
    @books = []
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
end
