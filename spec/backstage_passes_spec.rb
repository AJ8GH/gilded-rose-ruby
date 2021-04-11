describe BackstagePasses do
  subject(:backstage_passes) { described_class.new(11, 1) }

  describe '#update_quality' do
    it 'reduces sell in by 1' do
      expect {
        backstage_passes.update_quality
      }.to change { backstage_passes.sell_in }.by(-1)
    end

    context 'when sell in value > 10' do
      it 'increases quality by 1' do
        expect {
          backstage_passes.update_quality
        }.to change { backstage_passes.quality }.by(1)
      end
    end

    context 'when sell in value is between 10 and 5' do
      subject(:backstage_passes) { described_class.new(10, 1) }

      it 'increases quality by 2' do
        expect {
          backstage_passes.update_quality
        }.to change { backstage_passes.quality }.by(2)
      end
    end

    context 'when sell in value <= 5' do
      subject(:backstage_passes) { described_class.new(5, 1) }

      it 'increases quality by 3' do
        expect {
          backstage_passes.update_quality
        }.to change { backstage_passes.quality }.by(3)
      end
    end
  end
end
