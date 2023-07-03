require 'rspec'
require_relative '../label'

RSpec.describe Label do
  let(:title) { 'Sample Label' }
  let(:color) { 'red' }

  subject { described_class.new(title, color) }

  describe '#initialize' do
    it 'assigns instance variables correctly' do
      expect(subject.title).to eq(title)
      expect(subject.color).to eq(color)
      expect(subject.items).to be_empty
    end
  end

  describe '#add_item' do
    let(:item) { double('Item') }

    before do
      allow(item).to receive(:label=)
    end

    it 'adds the item to the label' do
      subject.add_item(item)
      expect(subject.items).to contain_exactly(item)
    end

    it 'sets the label on the item' do
      expect(item).to receive(:label=).with(subject)
      subject.add_item(item)
    end
  end
end
