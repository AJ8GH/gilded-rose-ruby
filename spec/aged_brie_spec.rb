describe AgedBrie do
  subject(:aged_brie) { described_class.new(5, 5) }
  subject(:double_aged_brie) { described_class.new(0, 5) }

  describe '#update_quality' do
    it 'reduces the sell in by 1' do
      expect { aged_brie.update_quality }.to change { aged_brie.sell_in }.by(-1)
    end

    context 'when sell in > 0' do
      it 'increases quality value by 1' do
        expect {
          aged_brie.update_quality
        }.to change { aged_brie.quality }.by(1)
      end
    end

    context 'when sell in <= 0' do
      it 'increases quality value by 2' do
        expect {
          double_aged_brie.update_quality
        }.to change { double_aged_brie.quality }.by(2)
      end
    end
  end
end
