require_relative '../classes/book'

describe Book do
  book = Book.new('Title', 'Author')

  context '#initialize' do
    it 'should initialize a book' do
      expect(book.id).to be_kind_of Numeric
      expect(book.rentals).to be_empty
      expect(book.title).to eql 'Title'
      expect(book.author).to eql 'Author'
    end
  end

  context '#add_rental' do
    it 'should add a rental' do
      first_rental = double('rental')
      second_rental = double('rental')
      allow(first_rental).to receive(:book=)
      allow(second_rental).to receive(:book=)

      book.add_rental(first_rental)
      book.add_rental(second_rental)

      expect(book.rentals.length).to eql 2
    end
  end
end
