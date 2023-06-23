require_relative 'app'

def show_menu
  puts 'Please choose an option by entering a number:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List all rentals for a given person id'
  puts '7. Exit'
  print 'Your input: '
end

def process_input(app, input)
  case input.to_i
  when 1
    app.list_all_books
  when 2
    app.list_all_people
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    app.list_person_rentals
  end
end

def invalid_option
  puts 'Please enter a valid option!'
end

def main
  app = App.new
  loop do
    show_menu
    input = gets.chomp
    process_input(app, input) if (1..7).to_a.include?(input.to_i)
    invalid_option unless (1..7).to_a.include?(input.to_i)
    if input.to_i == 7
      puts 'Goodbye see you soon!'
      break
    end
    puts 'Press Enter to continue...'
    gets
  end
end

main
