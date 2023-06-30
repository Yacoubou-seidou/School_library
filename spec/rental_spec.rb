require_relative '../classes/rental'
require 'date'

describe Rental do
  let(:date) { Date.today }
  let(:book) { double('book') }
  let(:person) { double('person') }
  let(:rental) { Rental.new(date, book, person) }

  describe '#initialize' do
    it 'sets the date' do
      expect(rental.date).to eq date
    end

    it 'sets the book' do
      expect(rental.book).to eq book
    end

    it 'sets the person' do
      expect(rental.person).to eq person
    end
  end

  describe '#book=' do
    it 'updates the book and adds the rental to the book' do
      new_book = double('new_book')
      rentals = []
      allow(new_book).to receive(:rentals).and_return(rentals)
      rental.book = new_book
      expect(rental.book).to eq new_book
      expect(rentals).to include(rental)
    end
  end

  describe '#person=' do
    it 'updates the person and adds the rental to the person' do
      new_person = double('new_person')
      rentals = []
      allow(new_person).to receive(:rentals).and_return(rentals)
      rental.person = new_person
      expect(rental.person).to eq new_person
      expect(rentals).to include(rental)
    end
  end
end
