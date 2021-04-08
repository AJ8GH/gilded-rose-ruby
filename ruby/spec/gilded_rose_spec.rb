describe GildedRose do
  describe '#update_quality' do
    items = [Item.new('foo', 0, 0)]
    items2 = [Item.new('foo', 1, 1)]

    it 'does not change the name' do
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq 'foo'
    end

    it 'does not reduce item quality past 0' do
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to be_zero
    end

    it 'reduces item quality when yet not at 0' do
      expect(items2[0].quality).to be(1)
      GildedRose.new(items2).update_quality()
      expect(items2[0].quality).to be_zero
    end
  end
end
