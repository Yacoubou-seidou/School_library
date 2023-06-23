require_relative 'nameable'
require_relative 'decorator'
class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true, id: rand)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_accessor :name, :age, :parent_permission
  attr_reader :id, :rentals

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(rental)
    @rentals << rental
    rental.person = self
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
