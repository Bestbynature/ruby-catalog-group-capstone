require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

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
    @on_spotify = params['on_spotify']
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
