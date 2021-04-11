class BackstagePasses < Item
  def initialize(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in, quality)
    super
  end

  def update_quality
    self.sell_in -= 1
  end
end
