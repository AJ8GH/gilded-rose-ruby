class AgedBrie < Item
  def initialize(name = 'Aged Brie', sell_in, quality)
    @name = name
    super
  end

  def update_quality
    self.sell_in -= 1
    sell_in > 0 ? self.quality += 1 : self.quality += 2
  end
end
