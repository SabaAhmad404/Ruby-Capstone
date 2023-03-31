require_relative '../classes/item'

describe Item do
  let(:item) { Item.new('2022-03-14') }
  describe '#initialize' do
    it 'should return a item object' do
      expect(item).to be_a_kind_of(Item)
    end
    it 'should return a item object with a published_date' do
      published_date = item.instance_variable_get(:@published_date)
      expect(published_date).to eq(nil)
    end
  end

  describe '#can_be_archived?' do
    it 'should return false if @last_played_at > 2' do
      result = item.can_be_archived?
      expect(result).to eq(false)
    end
  end

  describe '# add_genre method' do
    it 'should add genre to genres array' do
      item.add_genre('Action')
      expect(item.genre).to include('Action')
    end
  end

  describe '# add_author method' do
    it 'should add author to authors array' do
      item.add_author('John')
      expect(item.author).to include('John')
    end
  end

  describe '# add_source method' do
    it 'should add source to sources array' do
      item.add_source('Source')
      expect(item.source).to include('Source')
    end
  end

  describe '# move_to_archive method' do
    it 'should move item to archive' do
      item.move_to_archive
      expect(item.archived).to eq(false)
    end
  end
end
