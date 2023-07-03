require_relative '../app_helper'

RSpec.describe 'AppHelper' do
  let(:genres) { [] }
  let(:labels) { [] }
  let(:authors) { [] }
  let(:sources) { [] }
  let(:items) { [] }
  let(:app_helper) { AppHelper.new(genres, labels, authors, sources, items) }

  describe '#create_genre' do
    it 'creates a new genre if it does not exist' do
      genre_name = 'Fiction'

      app_helper.create_genre(genre_name)

      expect(genres.length).to eq(1)
      expect(genres.first.name).to eq(genre_name)
    end

    it 'does not create a new genre if it already exists' do
      genre_name = 'Fiction'
      existing_genre = Genre.new(genre_name)
      genres << existing_genre

      app_helper.create_genre(genre_name)

      expect(genres.length).to eq(1)
      expect(genres.first).to eq(existing_genre)
    end
  end

  describe '#create_author' do
    it 'creates a new author if they do not exist' do
      author_first_name = 'John'
      author_last_name = 'Doe'

      app_helper.create_author(author_first_name, author_last_name)

      expect(authors.length).to eq(1)
      expect(authors.first.first_name).to eq(author_first_name)
      expect(authors.first.last_name).to eq(author_last_name)
    end

    it 'does not create a new author if they already exist' do
      author_first_name = 'John'
      author_last_name = 'Doe'
      existing_author = Author.new(author_first_name, author_last_name)
      authors << existing_author

      app_helper.create_author(author_first_name, author_last_name)

      expect(authors.length).to eq(1)
      expect(authors.first).to eq(existing_author)
    end
  end

  describe '#create_label' do
    it 'creates a new label if it does not exist' do
      title = 'Label 1'
      color = 'Blue'

      app_helper.create_label(title, color)

      expect(labels.length).to eq(1)
      expect(labels.first.title).to eq(title)
      expect(labels.first.color).to eq(color)
    end

    it 'does not create a new label if it already exists' do
      title = 'Label 1'
      color = 'Blue'
      existing_label = Label.new(title, color)
      labels << existing_label

      app_helper.create_label(title, color)

      expect(labels.length).to eq(1)
      expect(labels.first).to eq(existing_label)
    end
  end

  describe '#create_source' do
    it 'creates a new source if it does not exist' do
      source_name = 'Source 1'

      app_helper.create_source(source_name)

      expect(sources.length).to eq(1)
      expect(sources.first.name).to eq(source_name)
    end

    it 'does not create a new source if it already exists' do
      source_name = 'Source 1'
      existing_source = Source.new(source_name)
      sources << existing_source

      app_helper.create_source(source_name)

      expect(sources.length).to eq(1)
      expect(sources.first).to eq(existing_source)
    end
  end
end
