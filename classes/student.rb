require_relative 'person'

class Student < Person
  attr_reader :classroom, :parent_permission

  def initialize(age, classroom, name = 'Unknown', parent_permission: true, id: rand)
    super(age, name, id: id)
    @classroom = classroom
    @parent_permission = parent_permission
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
