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

  def load_rentals
    all_rentals = []
    rental_file = './data/rentals.json'
    if File.exist?(rental_file) && !File.empty?(rental_file)
      rentals_data = File.read(rental_file)
      all_rentals = JSON.parse(rentals_data).map do |rental|
        Rental.new(rental['date'], person(rental['person_id']), book(rental['book_id']))
      end
    else
      puts 'No rental data found.'
    end
    all_rentals
  end
end