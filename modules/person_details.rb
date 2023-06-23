require_relative '../classes/student'
require_relative '../classes/teacher'
require_relative '../classes/classroom'

module PersonDetails
  def teacher_details
    teacher = { name: '', age: 0, specialization: nil }
    loop do
      print 'Enter teacher\'s age: '
      teacher[:age] = gets.strip.to_i
      break unless teacher[:age].zero?
    end
    loop do
      print 'Enter teacher\'s name: '
      teacher[:name] = gets.strip
      break unless teacher[:name].empty?
    end
    loop do
      print 'Enter teacher\'s specialization: '
      teacher[:specialization] = gets.strip
      break unless teacher[:specialization].empty?
    end
    teacher
  end

  def student_age
    print 'Enter student age: '
    gets.strip.to_i
  end

  def student_name
    print 'Enter student name: '
    gets.strip
  end

  def student_classroom
    print 'Enter classroom label: '
    gets.strip
  end

  def student_details
    student = { name: '', age: 0, parent_permission: true, classroom: '' }
    loop do
      student[:age] = student_age
      break unless student[:age].zero?
    end
    loop do
      student[:name] = student_name
      break unless student[:name].empty?
    end
    loop do
      classroom_label = student_classroom
      student[:classroom] = Classroom.new(classroom_label) if classroom_label.length
      break if classroom_label.length
    end
    loop do
      parent_permission = get_permission_input('Has parent permission ?: ')
      student[:parent_permission] = parent_permission
      break if [true, false].include? student[:parent_permission]
    end
    student
  end

  def get_permission_input(prompt)
    loop do
      puts "#{prompt} [Y/N]: "
      input = gets.strip.downcase

      case input
      when 'y', 'yes'
        return true
      when 'n', 'no'
        return false
      else
        puts 'Enter Y (yes) or N (no)!'
      end
    end
  end
end
