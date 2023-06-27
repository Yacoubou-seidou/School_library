require 'json'

module DataLoader
  def load_data
    load_books
    load_persons
    load_rentals
  end

  private

  def load_books
    if File.exist?('./data/books.json')
      books_data = JSON.parse(File.read('./data/books.json'))
      @books = books_data.map do |book_data|
        create_book(book_data[:id], book_data[:title], book_data[:author])
      end
    else
      @books = []
    end
  end

  def load_persons
    if File.exist?('./data/persons.json')
      persons_data = JSON.parse(File.read('./data/persons.json'))
      persons_data.each do |person_data|
        if person_data[:classroom].nil?
          create_teacher(person_data[:id], person_data[:name], person_data[:parent_permission], person_data[:age], person_data[:specialization])
        else
          classroom = Classroom.find_by_label(person_data[:classroom])
          create_student(person_data[:id], person_data[:name], person_data[:parent_permission], person_data[:age], classroom)
        end
      end
    else
      @students = []
      @teachers = []
    end
  end

  def load_rentals
    if File.exist?('./data/rentals.json')
      rentals_data = JSON.parse(File.read('./data/rentals.json'))
      rentals_data.each do |rental_data|
        person = find_person(rental_data[:person_id])
        book = find_book(rental_data[:book_id])
        create_rental(person, book, Date.parse(rental_data[:date]))
      end
    else
      @students.each { |student| student.rentals = [] }
      @teachers.each { |teacher| teacher.rentals = [] }
    end
  end
end
