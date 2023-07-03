require_relative '../author'
require_relative '../item'

RSpec.describe Author do
  let(:author) { Author.new('John', 'Doe') }
  let(:item_params) do
    {
      'title' => 'Some Title',
      'genre_name' => 'Genre',
      'author_first_name' => 'John',
      'author_last_name' => 'Doe',
      'source_name' => 'Source',
      'color' => 'Red',
      'publish_date' => Time.now
    }
  end
  let(:item) { Item.new(item_params) }

  describe '#initialize' do
    it 'sets the first_name attribute' do
      expect(author.first_name).to eq('John')
    end

    it 'sets the last_name attribute' do
      expect(author.last_name).to eq('Doe')
    end

    it 'generates a random id between 1 and 1000' do
      expect(author.id).to be >= 1
      expect(author.id).to be <= 1000
    end

    it 'initializes an empty collection of items' do
      expect(author.items).to be_empty
    end
  end

  describe '#add_item' do
    it 'adds the item to the collection of items' do
      author.add_item(item)
      expect(author.items).to include(item)
    end

    it 'sets the author property of the item' do
      author.add_item(item)
      expect(item.author).to eq(author)
    end
  end
end
