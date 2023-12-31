require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, specialization, name = 'Unknown', id: rand)
    super(age, name, id: id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
