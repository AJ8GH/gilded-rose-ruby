class BackstagePasses < Item
  def initialize(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in, quality)
    super
  end

  def update_quality
    sell_in > 10 ? self.quality += 1 : self.quality += 2
    self.sell_in -= 1
  end
end
