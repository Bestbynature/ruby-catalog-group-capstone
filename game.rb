require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

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
    @multiplayer = params['multiplayer']
    @last_played_at = params['last_played_at']
  end

  def can_be_archived?
    super && (Time.now.year - params['last_played_at'].to_i) > 2
  end
end
