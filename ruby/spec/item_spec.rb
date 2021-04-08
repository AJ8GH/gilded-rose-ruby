describe Item do
  subject(:item) { described_class.new(:name, 0, 0) }

  describe '#name' do
    it 'returns the name' do
      expect(item.name).to be(:name)
    end
  end
end
