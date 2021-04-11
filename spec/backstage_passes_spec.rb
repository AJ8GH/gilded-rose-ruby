describe BackstagePasses do
  subject(:backstage_passes) { described_class.new(11, 1) }

  describe '#update_quality' do
    it 'reduces sell in by 1' do
      expect {
        backstage_passes.update_quality
      }.to change { backstage_passes.sell_in }.by(-1)
    end
  end
end
