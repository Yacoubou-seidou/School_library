class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author, id: rand)
    @id = id
    @title = title
    @author = author
    @rentals = []
  end
  attr_reader :id

  def add_rental(rental)
    @rentals << rental
    rental.book = self
  end
end
