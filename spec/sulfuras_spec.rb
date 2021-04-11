describe Sulfuras do
  subject(:sulfuras) { described_class.new(0, 80) }

  describe '#update_quality' do
    it 'does not change the sell in value' do
      sulfuras.update_quality
      expect(sulfuras.sell_in).to be_zero
    end

    it 'does not change the quality' do
      sulfuras.update_quality
      expect(sulfuras.quality).to be(80)
    end
  end
end
