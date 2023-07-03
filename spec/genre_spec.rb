require_relative '../genre'
require_relative '../book'

RSpec.describe Genre do
  let(:genre_name) { 'Mystery' }
  let(:genre) { Genre.new(genre_name) }

  describe '#initialize' do
    it 'sets the name of the genre' do
      expect(genre.name).to eq(genre_name)
    end

    it 'generates a random id for the genre' do
      expect(genre.id).to be_a(Integer)
    end

    it 'initializes an empty array of items' do
      expect(genre.items).to eq([])
    end
  end

  describe '#add_item' do
    let(:book_params) do
      {
        'title' => 'Book Title',
        'genre_name' => genre_name,
        'author_first_name' => 'John',
        'author_last_name' => 'Doe',
        'source_name' => 'Source',
        'color' => 'Red',
        'publish_date' => Time.now
      }
    end
    let(:book) { Book.new(book_params) }

    it 'adds the item to the genre\'s collection of items' do
      genre.add_item(book)
      expect(genre.items).to include(book)
    end

    it 'sets the genre property of the item' do
      genre.add_item(book)
      expect(book.genre).to eq(genre)
    end
  end
end
