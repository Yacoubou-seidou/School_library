require 'date'
require_relative 'modules/book'
require_relative 'modules/person'
require_relative 'modules/rental'
require_relative 'modules/save_data'
require_relative 'modules/data_loaders'

class App
  def initialize
    @books = []
    @students = []
    @teachers = []
  end

  include BOOK
  include PERSON
  include RENTAL
  include SAVEDATA
  extend DATALOADERS

  def self.load_data
    load_books
    load_people
    load_rentals
  end
end
