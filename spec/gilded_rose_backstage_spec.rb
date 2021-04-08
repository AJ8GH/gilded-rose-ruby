describe GildedRose do
  describe '#update_quality' do
    name = 'Backstage passes to a TAFKAL80ETC concert'
    let(:items) { [Item.new(name, 11, 1)] }

    describe 'backstage pass' do
      it 'reduces sell in value' do
        expect {
          GildedRose.new(items).update_quality
        }.to change { items[0].sell_in }.by(-1)
      end

      context 'when sell in value > 10' do
        it 'increase quality by 1' do
          expect {
            GildedRose.new(items).update_quality
          }.to change { items[0].quality }.by(1)
        end
      end
    end
  end
end
