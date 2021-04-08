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

    #   context 'when sell_in > 0' do
    #     it 'increases quality value by 1' do
    #       expect {
    #         GildedRose.new(items0).update_quality
    #       }.to change { items0[0].quality }.by(1)
    #     end
    #   end

    #   context 'when sell_in <= 0' do
    #     it 'increases quality value by 2' do
    #       expect {
    #         GildedRose.new(items1).update_quality
    #       }.to change { items1[0].quality }.by(2)
    #     end
    #   end

    #   it 'does not increase quality past 50' do
    #     gilded_rose = GildedRose.new(items0)
    #     100.times { gilded_rose.update_quality }
    #     expect(items0[0].quality).to be(50)
    #   end
    # end

  end
end
