require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom)
    super()
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
