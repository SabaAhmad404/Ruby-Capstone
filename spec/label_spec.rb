require_relative '../classes/book/label'
require_relative '../classes/item'
require_relative '../classes/book/book'

describe Label do
  let(:label) { Label.new('title', 'color') }
  let(:item) { Item.new('2009-06-01') }
  let(:book) { Book.new('publisher', 'good', '2009-06-01') }

  context '# initialize method' do
    it 'should return a label object' do
      expect(label).to be_a_kind_of(Label)
    end

    it 'should return title' do
      title = label.instance_variable_get(:@title)
      expect(title).to eq('title')
    end

    it 'should return color' do
      color = label.instance_variable_get(:@color)
      expect(color).to eq('color')
    end
  end

  context '# add_item method' do
    it 'should add item to items array' do
      label.add_item(item)
      expect(label.items).to include(item)
    end

    it 'should add book to items array' do
      label.add_item(book)
      expect(label.items).to include(book)
    end
  end

  context '# to_json method' do
    it 'should return a hash with title' do
      expect(label.to_json).to include('title')
    end

    it 'should return a hash with color' do
      expect(label.to_json).to include('color')
    end

    it 'should return a hash with items' do
      expect(label.to_json).to include('items')
    end
  end
end
