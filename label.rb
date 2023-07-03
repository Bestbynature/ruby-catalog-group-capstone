class Label
  attr_reader :id, :title, :color
  attr_accessor :items

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    items << item
    item.label = self
  end
end
