require 'time'

class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
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

  private

  def of_age?
    @age >= 18
  end
end
