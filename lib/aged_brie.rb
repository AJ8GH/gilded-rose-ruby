class AgedBrie < Item
  MAXIMUM_QUALITY = 50

  def initialize(name = 'Aged Brie', sell_in, quality)
    super
  end

  def update_quality
    sell_in > 0 ? self.quality += 1 : self.quality += 2
    self.quality = MAXIMUM_QUALITY if quality > MAXIMUM_QUALITY
    self.sell_in -= 1
  end
end
