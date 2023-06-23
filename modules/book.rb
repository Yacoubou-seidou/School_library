require_relative '../classes/book'

module BOOK
  def list_all_books
    if @books.empty?
      puts 'No book available!'
      return
    end

    puts "All books (#{@books.length})"
    @books.each do |book|
      puts "Title: '#{book.title}', Author: #{book.author}"
    end
  end

  def create_book
    title = ''
    author = ''
    loop do
      print 'Enter book title: '
      title = gets.strip
      break unless title.empty?
    end
    loop do
      print 'Enter book author: '
      author = gets.strip
      break unless author.empty?
    end
    book = Book.new(title, author)
    @books << book
    puts 'New book added!'
  end
end
