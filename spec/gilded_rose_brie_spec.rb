describe GildedRose do
  describe '#update_quality' do
    let(:items0) { [Item.new('Aged Brie', 1, 0)] }
    let(:items1) { [Item.new('Aged Brie', 0, 0)] }

    describe 'Aged Brie' do
      it 'reduces sell in value' do
        expect {
          GildedRose.new(items0).update_quality
        }.to change { items0[0].sell_in }.by(-1)
      end

      context 'when sell_in > 0' do
        it 'increases quality value by 1' do
          expect {
            GildedRose.new(items0).update_quality
          }.to change { items0[0].quality }.by(1)
        end
      end

      context 'when sell_in <= 0' do
        it 'increases quality value by 2' do
          expect {
            GildedRose.new(items1).update_quality
          }.to change { items1[0].quality }.by(2)
        end
      end
    end
  end
end
