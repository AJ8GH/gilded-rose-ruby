class BackstagePasses < Item
  def initialize(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in, quality)
    super
  end

  def update_quality
    sell_in > 10 ? self.quality += 1 :
    sell_in > 5 ? self.quality += 2 :
    sell_in > 0 ? self.quality += 3 : self.quality = 0

    self.sell_in -= 1
  end
end
