describe Normal do
  subject(:normal) { described_class.new('normal', 1, 1) }

  describe '#update_quality' do
    it 'reduces sell in by 1' do
      expect { normal.update_quality }.to change { normal.sell_in }.by(-1)
    end

    context 'when sell in > 0'
    it 'reduces quality by 1' do
      expect { normal.update_quality }.to change { normal.quality }.by(-1)
    end
  end
end
