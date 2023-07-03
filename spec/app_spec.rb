require_relative '../app'

RSpec.describe 'App' do
  let(:app) { App.new }

  describe '#list_all_books' do
    it 'prints a list of all books' do
      items = [
        Book.new(id: 1, title: 'Book 1', genre_name: 'Fiction', color: 'Blue',
                 author_first_name: 'John', author_last_name: 'Doe', publish_date: '2021-01-01'),
        Book.new(id: 2, title: 'Book 2', genre_name: 'Non-fiction', color: 'Red',
                 author_first_name: 'Jane', author_last_name: 'Smith', publish_date: '2022-02-02')
      ]
      allow(app).to receive(:list_items)

      expect(app).to receive(:list_items).with(items, Book, 'book')
      app.instance_variable_set(:@items, items)
      app.list_all_books
    end
  end

  describe '#list_all_genres' do
    it 'prints a list of all genres' do
      genres = [
        Genre.new(id: 1, name: 'Fiction'),
        Genre.new(id: 2, name: 'Non-fiction')
      ]
      allow(app).to receive(:display_items)

      expect(app).to receive(:display_items).with(
        genres,
        'Genres',
        an_instance_of(Proc)
      )
      app.instance_variable_set(:@genres, genres)
      app.list_all_genres
    end
  end

  describe '#add_a_book' do
    it 'calls the appropriate method on the AppHelper' do
      app_helper = instance_double('AppHelper')
      allow(AppHelper).to receive(:new).and_return(app_helper)

      expect(app_helper).to receive(:add_a_book)
      app.add_a_book
    end
  end

  describe '#save_all_data' do
    let(:file_saver) { instance_double('FileSaver') }
    let(:genres) { [Genre.new(id: 1, name: 'Fiction')] }
    let(:labels) { [] }
    let(:authors) { [] }
    let(:sources) { [] }
    let(:items) { [] }

    before do
      allow(FileSaver).to receive(:new).and_return(file_saver)
      allow(app).to receive(:puts)
      app.instance_variable_set(:@genres, genres)
      app.instance_variable_set(:@labels, labels)
      app.instance_variable_set(:@authors, authors)
      app.instance_variable_set(:@sources, sources)
      app.instance_variable_set(:@items, items)
    end

    it 'saves all genres if there are genres' do
      expect(file_saver).to receive(:save_all_genres)
      app.save_all_data
    end

    it 'does not save genres if there are no genres' do
      app.instance_variable_set(:@genres, [])
      expect(file_saver).not_to receive(:save_all_genres)
      app.save_all_data
    end
  end
end
