describe AgedBrie do
  subject(:aged_brie) { described_class.new(5, 5) }

  describe '#update_quality' do
    it 'reduces the sell in by 1' do
      expect { aged_brie.update_quality }.to change { aged_brie.sell_in }.by(-1)
    end
  end
end
