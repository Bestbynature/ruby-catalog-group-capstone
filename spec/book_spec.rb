require_relative '../book'
require_relative '../item'

RSpec.describe Book do
  let(:book_params) do
    {
      'title' => 'Book Title',
      'genre_name' => 'Genre',
      'author_first_name' => 'John',
      'author_last_name' => 'Doe',
      'source_name' => 'Source',
      'color' => 'Red',
      'publish_date' => Time.now,
      'publisher' => 'Publisher Name',
      'cover_state' => 'bad'
    }
  end
  let(:book) { Book.new(book_params) }

  describe '#can_be_archived?' do
    context 'when cover_state is bad' do
      it 'returns true' do
        expect(book.can_be_archived?).to be true
      end
    end

    context 'when cover_state is not bad' do
      let(:item_instance) { instance_double(Item) }

      before do
        allow(Item).to receive(:new).and_return(item_instance)
        allow(item_instance).to receive(:can_be_archived?).and_return(false)
      end

      it 'calls the parent can_be_archived? method' do
        expect(book.can_be_archived?).to be false
        expect(item_instance).to have_received(:can_be_archived?)
      end
    end
  end
end
