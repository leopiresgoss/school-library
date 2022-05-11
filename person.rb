require 'time'

class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Time.now.to_i
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # getters and setters
  attr_reader :id

  attr_accessor :name, :age

  def can_use_services?
    @parent_permission || of_age?
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

# base decorator
class BaseDecorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

# decorators
class CapitalizeDecorator < BaseDecorator
  def correct_name
    super()
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    super()
    @nameable.correct_name[0, 9]
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
