require 'rspec'
require_relative '../source'

RSpec.describe Source do
  let(:name) { 'Sample Source' }

  subject { described_class.new(name) }

  describe '#initialize' do
    it 'assigns instance variables correctly' do
      expect(subject.name).to eq(name)
      expect(subject.items).to be_empty
    end
  end

  describe '#add_item' do
    let(:item) { double('Item') }

    before do
      allow(item).to receive(:source=)
    end

    it 'adds the item to the source' do
      subject.add_item(item)
      expect(subject.items).to contain_exactly(item)
    end

    it 'sets the source on the item' do
      expect(item).to receive(:source=).with(subject)
      subject.add_item(item)
    end
  end
end
