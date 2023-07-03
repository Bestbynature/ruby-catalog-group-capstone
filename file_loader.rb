class FileLoader
  def load_all_items
    if File.exist?('items.json')
      file = File.read('items.json')
      data = JSON.parse(file)
      parse_items(data)

    else
      []
    end
  end

  def load_all_genres
    if File.exist?('genres.json')
      file = File.read('genres.json')
      data = JSON.parse(file)
      parse_genres(data)

    else
      []
    end
  end

  def load_all_authors
    if File.exist?('authors.json')
      file = File.read('authors.json')
      data = JSON.parse(file)
      parse_authors(data)

    else
      []
    end
  end

  def load_all_labels
    if File.exist?('labels.json')
      file = File.read('labels.json')
      data = JSON.parse(file)
      parse_labels(data)

    else
      []
    end
  end

  def load_all_sources
    if File.exist?('sources.json')
      file = File.read('sources.json')
      data = JSON.parse(file)
      parse_sources(data)

    else
      []
    end
  end

  def parse_items(data)
    result = []
    data.each do |item|
      result << create_item_object(item)
    end
    result
  end

  def create_item_object(item)
    item_object = {
      'title' => item['title'],
      'genre_name' => item['genre_name'],
      'author_first_name' => item['author_first_name'],
      'author_last_name' => item['author_last_name'],
      'source_name' => item['source'],
      'color' => item['color'],
      'publish_date' => item['publish_date']
    }

    create_actual_item_object(item_object, item)
  end

  def create_actual_item_object(item_object, item)
    case item['type']
    when 'Movie'
      item_object['silent'] = item['silent']
      Movie.new(item_object)

    when 'MusicAlbum'
      item_object['on_spotify'] = item['on_spotify']
      MusicAlbum.new(item_object)

    when 'Game'
      item_object['multiplayer'] = item['multiplayer']
      item_object['last_played_at'] = item['last_played_at']
      Game.new(item_object)

    when 'Book'
      item_object['publisher'] = item['publisher']
      item_object['cover_state'] = item['cover_state']
      Book.new(item_object)

    end
  end

  def parse_genres(data)
    result = []
    data.each do |genre|
      result << Genre.new(genre['name'])
    end
    result
  end

  def parse_authors(data)
    result = []
    data.each do |author|
      result << Author.new(author['first_name'], author['last_name'])
    end
    result
  end

  def parse_labels(data)
    result = []
    data.each do |label|
      result << Label.new(label['title'], label['color'])
    end
    result
  end

  def parse_sources(data)
    result = []
    data.each do |source|
      result << Source.new(source['name'])
    end
    result
  end
end
