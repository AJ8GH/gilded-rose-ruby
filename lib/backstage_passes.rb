class BackstagePasses < Item
  MAXIMUM_QUALITY = 50

  def initialize(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in, quality)
    super
  end

  def update_quality
    return if quality == MAXIMUM_QUALITY

    sell_in > 10 ? self.quality += 1 :
    sell_in > 5 ? self.quality += 2 :
    sell_in > 0 ? self.quality += 3 : self.quality = 0

    self.quality = MAXIMUM_QUALITY if quality > MAXIMUM_QUALITY
    self.sell_in -= 1
  end
end
