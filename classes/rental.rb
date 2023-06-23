class Rental
  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  attr_accessor :date
  attr_reader :book, :person

  def book=(book)
    @book = book
    book.rentals << self unless book.rentals.include?(self)
  end

  def person=(person)
    @person = person
    person.rentals << self unless person.rentals.include?(self)
  end
end
