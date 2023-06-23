require_relative '../classes/student'
require_relative '../classes/teacher'
require_relative '../classes/classroom'
require_relative 'person_details'

module PERSON
  include PersonDetails
  def list_students
    return if @students.empty?

    @students.each_with_index do |student, index|
      puts "[Student] Name: #{student.name},ID: #{index}, Age: #{student.age}"
    end
  end

  def list_teachers
    return if @teachers.empty?

    @teachers.each_with_index do |teacher, index|
      puts "[Teacher] Name: #{teacher.name},ID: #{index}, Age: #{teacher.age}"
    end
  end

  def list_all_people
    puts 'No persons available!' unless @students.length.positive? || @teachers.length.positive?
    puts 'All people'
    list_students
    list_teachers
  end

  def create_person
    puts 'Enter 1 for student, 2 for teacher'

    loop do
      print 'Your input: '
      input = gets.strip.to_i
      case input
      when 1
        create_student
        break
      when 2
        create_teacher
        break
      else
        puts 'Enter 1 for student, 2 for teacher'
      end
    end
    puts
  end

  def create_student
    puts 'Student creation...'
    details = student_details
    student = Student.new(details[:age], details[:classroom], details[:name], details[:parent_permission])
    @students << student
    puts 'Student creation successed!'
  end

  def create_teacher
    puts 'Teacher creation...'
    details = teacher_details
    teacher = Teacher.new(details[:age], details[:specialization], details[:name])
    @teachers << teacher
    puts 'Teacher creation successed!'
  end
end
