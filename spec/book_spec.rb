require './classes/book/book'
require './classes/item'

# unit test for book class can_be_archived method
describe Book do
  let(:book) { Book.new('publisher', 'good', '2009-06-01') }
  let(:book2) { Book.new('publisher', 'bad', '2009-06-01') }
  let(:book3) { Book.new('publisher', 'good', '2019-06-01') }
  let(:book4) { Book.new('publisher', 'bad', '2019-06-01') }

  context '# initialize method' do
    it 'should return a book object' do
      expect(book).to be_a_kind_of(Book)
    end

    it 'should return publisher' do
      publisher = book.instance_variable_get(:@publisher)
      expect(publisher).to eq('publisher')
    end

    it 'should return cover state' do
      cover_state = book.instance_variable_get(:@cover_state)
      expect(cover_state).to eq('good')
    end
  end

  context '# can_be_archived method' do
    it 'should return true if book is older than 10 years and cover state is good' do
      expect(book.can_be_archived?).to be true
    end

    it 'should return true if book is older than 10 years and cover state is bad' do
      expect(book2.can_be_archived?).to be true
    end

    it 'should return false if book is not older than 10 years and cover state is good' do
      expect(book3.can_be_archived?).to be false
    end

    it 'should return true if book is not older than 10 years and cover state is bad' do
      expect(book4.can_be_archived?).to be true
    end
  end

  context '# to_json method' do
    it 'should return a hash with publish date' do
      expect(book.to_json).to include('publish_date')
    end

    it 'should return a hash with publisher' do
      expect(book.to_json).to include('publisher')
    end

    it 'should return a hash with cover state' do
      expect(book.to_json).to include('cover_state')
    end
  end
end
