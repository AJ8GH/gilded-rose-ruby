describe GildedRose do
  describe '#update_quality' do
    name = 'Backstage passes to a TAFKAL80ETC concert'

    describe 'backstage pass' do
      let(:items0) { [Item.new(name, 11, 1)] }

      it 'reduces sell in value' do
        expect {
          GildedRose.new(items0).update_quality
        }.to change { items0[0].sell_in }.by(-1)
      end

      context 'when sell in value > 10' do
        it 'increases quality by 1' do
          expect {
            GildedRose.new(items0).update_quality
          }.to change { items0[0].quality }.by(1)
        end
      end

      context 'when sell in value is between 10 and 5' do
        let(:items1) { [Item.new(name, 10, 1)] }
        let(:items2) { [Item.new(name, 6, 1)] }

        it 'increases quality by 2 when sell in is 10' do
          expect {
            GildedRose.new(items1).update_quality
          }.to change { items1[0].quality }.by(2)
        end

        it 'increases quality by 2 when sell in is 6' do
          expect {
            GildedRose.new(items2).update_quality
          }.to change { items2[0].quality }.by(2)
        end
      end

      context 'when sell in value <= 5' do
        let(:items3) { [Item.new(name, 5, 1)] }
        let(:items4) { [Item.new(name, 1, 1)] }

        it 'increases quality by 3 when sell in is 5' do
          expect {
            GildedRose.new(items3).update_quality
          }.to change { items3[0].quality }.by(3)
        end

        it 'increases quality by 3 when sell in is 1' do
          expect {
            GildedRose.new(items4).update_quality
          }.to change { items4[0].quality }.by(3)
        end
      end

      context 'when sell in value is zero' do
        it 'reduces quality to zero' do
          items5 = [Item.new(name, 0, 50)]
          GildedRose.new(items5).update_quality
          expect(items5[0].quality).to be_zero
        end
      end

      it 'stops increasing when quality hits 50' do
        items5 = [Item.new(name, 4, 49)]
        GildedRose.new(items5).update_quality
        expect(items5[0].quality).to be(50)

        GildedRose.new(items5).update_quality
        expect(items5[0].quality).to be(50)
      end
    end
  end
end
