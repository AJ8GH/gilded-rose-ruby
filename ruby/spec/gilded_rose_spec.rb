describe GildedRose do
  let(:item) { instance_double(Item, :item, name: 'foo', sell_in: 0, :sell_in= => 0, quality: 0) }

  describe '#update_quality' do
    it 'does not change the name' do
      GildedRose.new([item]).update_quality()
      expect(item.name).to eq 'foo'
    end
  end
end
