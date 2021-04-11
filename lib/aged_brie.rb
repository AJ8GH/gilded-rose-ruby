class AgedBrie < Item
  MAXIMUM_QUALITY = 50

  def initialize(name = 'Aged Brie', sell_in, quality)
    @name = name
    super
  end

  def update_quality
    self.sell_in -= 1
    self.quality = MAXIMUM_QUALITY if quality > MAXIMUM_QUALITY
    return if quality == MAXIMUM_QUALITY

    sell_in > 0 ? self.quality += 1 : self.quality += 2
  end
end
