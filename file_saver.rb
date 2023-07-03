class FileSaver
  def initialize(genres, labels, authors, sources, items)
    @genres = genres
    @labels = labels
    @authors = authors
    @sources = sources
    @items = items
  end

  def save_all_items
    serialized_items = serialize_items
    file_content = generate_file_content(serialized_items)
    write_to_file(file_content, 'items.json')
  end

  def save_all_genres
    serialized_genres = @genres.map do |genre|
      {
        'name' => genre.name
      }
    end
    file_content = generate_file_content(serialized_genres)
    write_to_file(file_content, 'genres.json')
  end

  def save_all_authors
    serialized_authors = @authors.map do |author|
      {
        'first_name' => author.first_name,
        'last_name' => author.last_name
      }
    end
    file_content = generate_file_content(serialized_authors)
    write_to_file(file_content, 'authors.json')
  end

  def save_all_labels
    serialized_labels = @labels.map do |label|
      {
        'title' => label.title,
        'color' => label.color
      }
    end
    file_content = generate_file_content(serialized_labels)
    write_to_file(file_content, 'labels.json')
  end

  def save_all_sources
    serialized_sources = @sources.map do |source|
      {
        'name' => source.name
      }
    end
    file_content = generate_file_content(serialized_sources)
    write_to_file(file_content, 'sources.json')
  end

  def serialize_items
    @items.map do |item|
      attributes = {
        'type' => item.class.to_s,
        'title' => item.label.title,
        'genre_name' => item.genre.name,
        'color' => item.label.color,
        'author_first_name' => item.author.first_name,
        'author_last_name' => item.author.last_name,
        'source' => item.source.name,
        'publish_date' => item.publish_date
      }

      attributes['on_spotify'] = item.on_spotify if item.is_a?(MusicAlbum)
      attributes['silent'] = item.silent if item.is_a?(Movie)
      add_book_attributes(attributes, item) if item.is_a?(Book)
      add_game_attributes(attributes, item) if item.is_a?(Game)

      attributes
    end
  end

  def add_book_attributes(attributes, book)
    attributes['publisher'] = book.publisher
    attributes['cover_state'] = book.cover_state
    attributes
  end

  def add_game_attributes(attributes, game)
    attributes['multiplayer'] = game.multiplayer
    attributes['last_played_at'] = game.last_played_at
    attributes
  end

  def generate_file_content(serialized_items)
    serialized_items.map { |item| JSON.generate(item) }.join(",\n")
  end

  def write_to_file(file_content, filename)
    file = File.open(filename, 'w')
    file.write("[\n#{file_content}\n]")
    file.close
  end
end
