require 'date'
require_relative 'modules/book'
require_relative 'modules/person'
require_relative 'modules/rental'
require_relative 'modules/save_data'
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
end
