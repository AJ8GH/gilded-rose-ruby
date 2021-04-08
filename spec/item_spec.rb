describe Item do
  subject(:item) { described_class.new(:item, 0, 0) }

  describe '#name' do
    it 'returns the name' do
      expect(item.name).to be(:item)
    end
  end

  describe '#sell_in' do
    it 'returns the sell in value' do
      expect(item.sell_in).to be_zero
    end
  end

  describe '#quality' do
    it 'returns the quality value' do
      expect(item.quality).to be_zero
    end
  end

  describe '#to_s' do
    it 'returns item attributes as a string' do
      expect(item.to_s).to eq('item, 0, 0')
    end
  end
end
