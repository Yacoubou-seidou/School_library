require 'date'
require_relative 'modules/book'
require_relative 'modules/person'
require_relative 'modules/rental'
class App
  def initialize
    @books = []
    @students = []
    @teachers = []
  end
  include BOOK
  include PERSON
  include RENTAL
end
