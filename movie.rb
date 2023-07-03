require_relative 'item'

class Movie < Item
  attr_accessor :silent

  def initialize(params)
    super({
      'title' => params['title'],
      'genre_name' => params['genre_name'],
      'author_first_name' => params['author_first_name'],
      'author_last_name' => params['author_last_name'],
      'source_name' => params['source_name'],
      'color' => params['color'],
      'publish_date' => params['publish_date']
    })
    @silent = params['silent']
  end

  # private

  def can_be_archived?
    super || @silent
  end
end
