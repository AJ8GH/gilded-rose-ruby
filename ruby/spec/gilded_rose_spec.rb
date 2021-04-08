describe GildedRose do
  describe '#update_quality' do
    items0 = [Item.new('foo', 0, 0)]
    items1 = [Item.new('foo', 1, 1)]
    items2 = [Item.new('foo', -1, 2)]

    describe 'regular items' do
      context 'when sell in value is positive' do
        it 'does not change the name' do
          GildedRose.new(items0).update_quality
          expect(items0[0].name).to eq 'foo'
        end

        it 'does not reduce item quality past 0' do
          GildedRose.new(items0).update_quality
          expect(items0[0].quality).to be_zero
        end

        it 'reduces item quality when yet not at 0' do
          expect {
            GildedRose.new(items1).update_quality
          }.to change { items1[0].quality }.by(-1)
        end
      end

      context 'when sell in value is negative' do
        it 'reduces item quality * 2' do
          expect {
          GildedRose.new(items2).update_quality
          }.to change { items2[0].quality }.by(-2)
        end
      end
    end
  end
end
