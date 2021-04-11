class AgedBrie < Item
  def initialize(name = 'Aged Brie', sell_in, quality)
    @name = name
    super
  end

  def update_quality
    self.sell_in -= 1
  end
end
