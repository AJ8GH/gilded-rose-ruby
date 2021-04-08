describe GildedRose do
  describe '#update_quality' do
    name = 'Backstage passes to a TAFKAL80ETC concert'
    let(:items0) { [Item.new(name, 11, 1)] }
    let(:items1) { [Item.new(name, 10, 1)] }
    let(:items2) { [Item.new(name, 6, 1)] }

    describe 'backstage pass' do
      it 'reduces sell in value' do
        expect {
          GildedRose.new(items0).update_quality
        }.to change { items0[0].sell_in }.by(-1)
      end

      context 'when sell in value > 10' do
        it 'increase quality by 1' do
          expect {
            GildedRose.new(items0).update_quality
          }.to change { items0[0].quality }.by(1)
        end
      end

      context 'when sell in value < 10 && > 5' do
        it 'increase quality by 2 at sell in == 10' do
          expect {
            GildedRose.new(items1).update_quality
          }.to change { items1[0].quality }.by(2)
        end

        it 'increase quality by 2 at sell in == 6' do
          expect {
            GildedRose.new(items2).update_quality
          }.to change { items2[0].quality }.by(2)
        end
      end
    end
  end
end
