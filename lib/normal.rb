class Normal < Item
  def update_quality
    sell_in > 0 ? self.quality -= 1 : self.quality -= 2
    self.quality = 0 if quality < 0
    self.sell_in -= 1
  end
end
