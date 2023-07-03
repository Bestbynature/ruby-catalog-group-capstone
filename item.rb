require_relative 'label'
require_relative 'genre'
require_relative 'author'
require_relative 'source'

class Item
  attr_accessor :title, :genre_name, :author_first_name, :author_last_name, :source_name, :color, :publish_date,
                :label, :genre, :author, :source
  attr_reader :id, :archived

  def initialize(params)
    @id = Random.rand(1000)
    @title = params['title']
    @genre_name = params['genre_name']
    @author_first_name = params['author_first_name']
    @author_last_name = params['author_last_name']
    @source_name = params['source_name']
    @color = params['color']
    @publish_date = params['publish_date']
    @archived = false

    @label = Label.new(params['title'], params['color'])
    @label.add_item(self)

    @genre = Genre.new(params['genre_name'])
    @genre.add_item(self)

    @author = Author.new(params['author_first_name'], params['author_last_name'])
    @author.add_item(self)

    @source = Source.new(params['source_name'])
    @source.add_item(self)
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
      puts "Moving #{@title} to archive"
    else
      puts "Can't move #{@title} to archive"
    end
  end

  # private

  def can_be_archived?
    (Time.now.year - @publish_date.to_i) > 10
  end
end
