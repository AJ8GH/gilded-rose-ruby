describe Normal do
  subject(:normal) { described_class.new('normal', 1, 1) }

  describe '#update_quality' do
    it 'reduces sell in by 1' do
      expect { normal.update_quality }.to change { normal.sell_in }.by(-1)
    end

    context 'when sell in > 0' do
      it 'reduces quality by 1' do
        expect { normal.update_quality }.to change { normal.quality }.by(-1)
      end
    end

    context 'when sell in <= 0' do
      subject(:normal) { described_class.new('normal', 0, 2) }

      it 'reduces quality by 2' do
        expect { normal.update_quality }.to change { normal.quality }.by(-2)
      end
    end

    it 'never reduces quality below 0' do
      100.times { normal.update_quality }
      expect(normal.quality).to be_zero
    end
  end
end
