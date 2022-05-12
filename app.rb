class App
  def initialize
    @options = ['List all books', 'List all people', 'Create a person', 'Create a book',
                'Create a rental', 'List all rentals for a given person id', 'Exit']
  end

  def run
    display_options
  end

  def display_options
    puts 'Please, choose an option by entering a number:'
    @options.each_with_index { |option, index| puts "#{index + 1} - #{option}" }
    select_option
  end

  def select_option
    option = gets.chomp.to_i
    display_options if option < 1 || option > 7
  end
end
