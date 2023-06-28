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
    all_persons = []
    people_file = './data/persons.json'
    if File.exist?(people_file) && !File.empty?(people_file)
      persons_data = File.read(people_file)
      all_persons = JSON.parse(persons_data).map do |person|
        if person['className'] == 'Student'
          Student.new(person['id'], person['age'], person['name'], person['parent_permission'], person['classroom'])
        else
          Teacher.new(person['id'], person['name'], person['age'], person['specialization'])
        end
      end
    else
      puts 'No person data found.'
    end
    all_persons
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
