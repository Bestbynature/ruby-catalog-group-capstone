class AppHelper
  def initialize(genres, labels, authors, sources, items)
    @genres = genres
    @labels = labels
    @authors = authors
    @sources = sources
    @items = items
  end

  def prompt_input(message)
    puts message
    gets.chomp
  end

  def add_item_common_fields
    title = prompt_input('Enter the title:')
    genre_name = prompt_input('Enter the genre:')
    color = prompt_input('Enter the color of the label:')
    author_first_name = prompt_input('Enter the author first name:')
    author_last_name = prompt_input('Enter the author last name:')
    source_name = prompt_input('Enter the source:')
    publish_date = prompt_input('Enter the year published (yyyy):')

    create_genre(genre_name)
    create_author(author_first_name, author_last_name)
    create_label(title, color)
    create_source(source_name)

    [title, genre_name, color, author_first_name, author_last_name, source_name, publish_date]
  end

  def create_genre(genre_name)
    genre = @genres.find { |g| g.name == genre_name }
    return unless genre.nil?

    genre = Genre.new(genre_name)
    @genres << genre
  end

  def create_author(author_first_name, author_last_name)
    author = @authors.find do |a|
      a.first_name == author_first_name && a.last_name == author_last_name
    end
    return unless author.nil?

    author = Author.new(author_first_name, author_last_name)
    @authors << author
  end

  def create_label(title, color)
    label = @labels.find { |l| l.title == title && l.color == color }
    return unless label.nil?

    label = Label.new(title, color)
    @labels << label
  end

  def create_source(source_name)
    source = @sources.find { |s| s.name == source_name }
    return unless source.nil?

    source = Source.new(source_name)
    @sources << source
  end

  def add_a_book
    publisher = prompt_input('Enter the publisher:')
    cover_state = prompt_input('Enter the cover state:')
    title, genre_name, color, author_first_name, author_last_name, source_name, publish_date = add_item_common_fields
    book_object = {
      'publisher' => publisher,
      'cover_state' => cover_state,
      'title' => title,
      'genre_name' => genre_name,
      'author_first_name' => author_first_name,
      'author_last_name' => author_last_name,
      'source_name' => source_name,
      'color' => color,
      'publish_date' => publish_date
    }
    book = Book.new(book_object)
    @items << book

    puts '-------------------------------------'
    puts 'Book added successfully'
    puts '-------------------------------------'
  end

  def add_a_music_album
    on_spotify = prompt_input('Is the music album on Spotify? (true/false)')
    title, genre_name, color, author_first_name, author_last_name, source_name, publish_date = add_item_common_fields
    music_album_object = {
      'on_spotify' => on_spotify,
      'title' => title,
      'genre_name' => genre_name,
      'author_first_name' => author_first_name,
      'author_last_name' => author_last_name,
      'source_name' => source_name,
      'color' => color,
      'publish_date' => publish_date
    }
    music_album = MusicAlbum.new(music_album_object)
    @items << music_album
    puts '-------------------------------------'
    puts 'Music album added successfully'
    puts '-------------------------------------'
  end

  def add_a_movie
    silent = prompt_input('Is the movie silent? (true/false)')
    title, genre_name, color, author_first_name, author_last_name, source_name, publish_date = add_item_common_fields
    movie_object = {
      'silent' => silent,
      'title' => title,
      'genre_name' => genre_name,
      'author_first_name' => author_first_name,
      'author_last_name' => author_last_name,
      'source_name' => source_name,
      'color' => color,
      'publish_date' => publish_date
    }
    movie = Movie.new(movie_object)
    @items << movie
    puts '-------------------------------------'
    puts 'Movie added successfully'
    puts '-------------------------------------'
  end

  def add_a_game
    multiplayer = prompt_input('Is the game multiplayer? (true/false)')
    last_played_at = prompt_input('Enter the last played year (yyyy):')
    title, genre_name, color, author_first_name, author_last_name, source_name, publish_date = add_item_common_fields
    game_object = {
      'multiplayer' => multiplayer,
      'last_played_at' => last_played_at,
      'title' => title,
      'genre_name' => genre_name,
      'author_first_name' => author_first_name,
      'author_last_name' => author_last_name,
      'source_name' => source_name,
      'color' => color,
      'publish_date' => publish_date
    }
    game = Game.new(game_object)
    @items << game
    puts '-------------------------------------'
    puts 'Game added successfully'
    puts '-------------------------------------'
  end
end
