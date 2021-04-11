describe Sulfuras do
  subject(:sulfuras) { described_class.new(0, 80) }

  describe '#update_quality' do
    it 'does not change the sell in value' do
      sulfuras.update_quality
      expect(sulfuras.sell_in).to be_zero
    end
  end
end
