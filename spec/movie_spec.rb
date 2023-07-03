require 'rspec'
require_relative '../movie'

RSpec.describe Movie do
  let(:params) do
    {
      'title' => 'Sample Movie',
      'genre_name' => 'Drama',
      'author_first_name' => 'Jane',
      'author_last_name' => 'Doe',
      'source_name' => 'Movie Studio',
      'color' => 'black',
      'publish_date' => '1990',
      'silent' => true
    }
  end

  subject { described_class.new(params) }

  describe '#initialize' do
    it 'assigns instance variables correctly' do
      expect(subject.title).to eq('Sample Movie')
      expect(subject.genre_name).to eq('Drama')
      expect(subject.author_first_name).to eq('Jane')
      expect(subject.author_last_name).to eq('Doe')
      expect(subject.source_name).to eq('Movie Studio')
      expect(subject.color).to eq('black')
      expect(subject.publish_date).to eq('1990')
      expect(subject.silent).to be_truthy
    end

    it 'calls the parent class initialize' do
      expect_any_instance_of(Item).to receive(:initialize).with(
        'title' => 'Sample Movie',
        'genre_name' => 'Drama',
        'author_first_name' => 'Jane',
        'author_last_name' => 'Doe',
        'source_name' => 'Movie Studio',
        'color' => 'black',
        'publish_date' => '1990'
      )
      described_class.new(params)
    end
  end

  describe '#can_be_archived?' do
    context 'when item can be archived' do
      before do
        allow(Time).to receive(:now).and_return(Time.new(2023))
        subject.silent = false
      end

      it 'returns true' do
        expect(subject.send(:can_be_archived?)).to be_truthy
      end
    end

    context 'when item cannot be archived and silent' do
      before do
        allow(Time).to receive(:now).and_return(Time.new(2010))
        subject.silent = true
      end

      it 'returns true' do
        expect(subject.send(:can_be_archived?)).to be_truthy
      end
    end

    context 'when item cannot be archived and not silent' do
      before do
        allow(Time).to receive(:now).and_return(Time.new(2023))
        subject.silent = false
      end

      it 'returns true' do
        expect(subject.send(:can_be_archived?)).to be_truthy
      end
    end
  end
end
