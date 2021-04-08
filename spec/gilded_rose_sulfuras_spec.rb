describe GildedRose do
  describe '#update_quality' do
    let(:items) { [Item.new('Sulfuras, Hand of Ragnaros', 0, 80)] }

    describe 'Sulfuras' do
      it 'does not reduce sell in value' do
        expect {
          GildedRose.new(items).update_quality
        }.to change { items[0].sell_in }.by(0)
      end

      it 'does not change quality value' do
        GildedRose.new(items).update_quality
        expect(items[0].quality).to be(80)
      end
    end
  end
end
