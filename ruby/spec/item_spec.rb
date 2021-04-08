describe Item do
  subject(:item) { described_class.new(:name, 0, 0) }

  describe '#name' do
    it 'returns the name' do
      expect(item.name).to be(:name)
    end
  end

  describe '#sell_in' do
    it 'returns the sell in value' do
      expect(item.sell_in).to be_zero
    end
  end
end
