require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

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
    @publisher = params['publisher']
    @cover_state = params['cover_state']
  end

  # private

  def can_be_archived?
    super || cover_state == 'bad'
  end
end
