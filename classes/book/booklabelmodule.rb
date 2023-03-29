require 'json'
require_relative './book'
require_relative './label'

module BookLabel
  def fetch_books
    book_path = './classes/book/books.json'
    File.open(book_path, 'w') unless File.exist?(book_path)
    book_data = File.read(book_path)
    if book_data.empty?
      []
    else
      File.open(book_path, 'r') { |line| JSON.parse(line.read) }
    end
  end

  def fetch_labels
    label_path = './classes/book/labels.json'
    File.open(label_path, 'w') unless File.exist?(label_path)
    label_data = File.read(label_path)
    if label_data.empty?
      []
    else
      File.open(label_path, 'r') { |line| JSON.parse(line.read) }
    end
  end

  def add_book
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover state[good or bad]: '
    cover_state = gets.chomp
    print 'Publication date (yyyy-mm-dd): '
    publish_date = gets.chomp
    publish_date = check_date(publish_date)
    book = Book.new(publisher, cover_state, publish_date)
    print 'Title of the label: '
    title = gets.chomp.capitalize
    print 'Color: '
    color = gets.chomp
    label = Label.new(title, color)
    book_item = book.to_json
    label.add_item(book_item)

    store_book(book)
    store_label(label)

    puts 'Book added successfully'
    puts 'Label added successfully'
  end

  def store_book(book)
    books = fetch_books
    books << book
    File.write('./classes/book/books.json', JSON.pretty_generate(books), mode: 'w')
  end

  def store_label(label)
    labels = fetch_labels
    labels << label
    File.write('./classes/book/labels.json', JSON.pretty_generate(labels), mode: 'w')
  end

  def list_all_books
    books = fetch_books
    return puts 'There are no books in the catalogue' if books.empty?

    books.each do |book|
      puts "Publisher: #{book['publisher']}, Publish Date: #{book['publish_date']}, Cover State: #{book['cover_state']}."
    end
  end

  def list_all_labels
    labels = fetch_labels
    return puts 'There are no labels in the catalogue' if labels.empty?

    labels.each do |label|
      puts "#{label['title']} - #{label['color']}"
    end
  end
end
