require 'json'
require_relative 'save_data'

module DATALOADERS
  include SAVEDATA

  def load_books
    all_books = nil
    book_file = './data/books.json'
    if File.exist?(book_file)
      books_data = File.read(book_file)
      all_books = JSON.parse(books_data)
    else
      puts 'No book data found.'
    end
    return unless all_books

    all_books.each do |book|
      id = book['id']
      title = book['title']
      author = book['author']
      new_books = Book.new(title, author, id: id)
      @books << new_books
    end
  end

  def load_people
    all_persons = load_persons_from_file('./data/persons.json')
    return [] unless all_persons

    all_persons.each do |person|
      if person['className'] == 'Student'
        add_student(person)
      else
        add_teacher(person)
      end
    end
  end

  def load_persons_from_file(file_path)
    return [] unless File.exist?(file_path) && !File.empty?(file_path)

    persons_data = File.read(file_path)
    JSON.parse(persons_data)
  end

  def add_student(person)
    id = person['id']
    age = person['age']
    name = person['name']
    parent_permission = person['parent_permission']
    classroom = person['classroom']
    new_student = Student.new(id, age, name, parent_permission, classroom)
    @students << new_student
  end

  def add_teacher(person)
  age = person['age']
  specialization = person['specialization']
  name = person['name']
  id = person['id']
  new_teacher = Teacher.new(age, specialization, name, id: id)
  @teachers << new_teacher
end

def find_person_by_id(person_id)
  person = @students.find { |student| student.id == person_id }
  person ||= @teachers.find { |teacher| teacher.id == person_id }
  person
end

def find_book_by_id(book_id)
  @books.find { |book| book.id == book_id }
end

def load_rentals
  rental_file = './data/rentals.json'

  if File.exist?(rental_file)
    rentals_data = File.read(rental_file)
    all_rentals = JSON.parse(rentals_data)

    all_rentals.each do |rental|
      person_id = rental['person_id']
      book_id = rental['book_id']
      date = rental['date']

      person = find_person_by_id(person_id)
      book = find_book_by_id(book_id)

      if person && book
        new_rental = Rental.new(date, book, person)
        @rentals << new_rental
      else
        puts "Person or book not found for rental with person_id: #{person_id} and book_id: #{book_id}"
      end
    end
  else
    puts 'No rental data found.'
  end
end

end
