class Normal < Item
  def update_quality
    self.sell_in -= 1
  end
end
