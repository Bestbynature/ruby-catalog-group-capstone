class Genre
  attr_reader :id, :name
  attr_accessor :items

  def initialize(name)
    @id = Random.rand(1000)
    @name = name
    @items = []
  end

  def add_item(item)
    items << item
    item.genre = self
  end
end
