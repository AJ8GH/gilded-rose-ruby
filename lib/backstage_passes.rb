class BackstagePasses < Item
  def initialize(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in, quality)
    super
  end

  def update_quality
    sell_in > 10 ? self.quality += 1 :
    sell_in > 5 ? self.quality += 2 : self.quality += 3
    self.sell_in -= 1
  end
end
