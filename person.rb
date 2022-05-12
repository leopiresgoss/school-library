require 'time'
require_relative 'nameable_decorators/nameable'
require_relative 'nameable_decorators/base_decorator'
require_relative 'nameable_decorators/decorators'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Time.now.to_i
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  # getters and setters
  attr_reader :id, :rentals

  attr_accessor :name, :age

  def can_use_services?
    @parent_permission || of_age?
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(22, 'maximilianus')
puts "person: #{person.correct_name}"
# => person: maximilianus

capitalize_person = CapitalizeDecorator.new(person)
puts "capitalizedPerson: #{capitalize_person.correct_name}"
# => capitalizedPerson: Maximilianus

capitalized_trimmed_person = TrimmerDecorator.new(capitalize_person)
puts "capitalized_trimmed_person: #{capitalized_trimmed_person.correct_name}"
# => capitalized_trimmed_person: Maximilia
