require_relative '../classes/rental'

module RENTAL
  def entering_date
    loop do
      puts 'Please enter a date (YYYY-MM-DD):'
      date_input = gets.chomp
      if date_input.match(/^\d{4}-\d{2}-\d{2}$/)
        begin
          return Date.parse(date_input)
        rescue ArgumentError
          puts 'Invalid date.'
        end
      else
        puts 'Invalid date format. Please try again.'
      end
    end
  end

  def create_rental
    puts 'New rental creation'
    book = book_details
    person = person_details
    date = entering_date
    puts "Date:#{date}"
    rental = Rental.new(date, book, person)
    person.add_rental(rental)
    puts 'Rental creation successed!'
  end

  def person_select(people)
    person_index = nil
    loop do
      print 'Enter valid person ID: '
      person_index = gets.strip.to_i
      puts person_index.to_s
      break unless people[person_index].nil?
    end
    people[person_index]
  end

  def list_person_rentals
    all_people = @teachers + @students

    puts 'No persons available!' if all_people.empty?
    return if all_people.empty?

    person = person_select(all_people)
    puts "All #{person.name}'s rentals:" unless person.rentals.empty?
    person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
    end
    puts "No rentals for #{person.name}." unless person.rentals.length.positive?
  end

  def book_details
    book_index = 0
    loop do
      puts 'Select a book from the following list by number'
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end
      print 'Your input: '
      book_index = gets.strip.to_i
      break unless @books[book_index].nil?
    end
    @books[book_index]
  end

  def person_details
    person_index = 0
    all_people = @teachers + @students
    loop do
      puts 'Select a person from the following list by number'
      all_people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, Age: #{person.age}"
      end
      print 'Your input: '
      person_index = gets.strip.to_i
      break unless all_people[person_index].nil?
    end
    all_people[person_index]
  end
end
