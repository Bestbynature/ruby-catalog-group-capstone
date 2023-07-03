require 'rspec'
require_relative '../music_album'

RSpec.describe MusicAlbum do
  let(:params) do
    {
      'title' => 'Sample Album',
      'genre_name' => 'Pop',
      'author_first_name' => 'John',
      'author_last_name' => 'Doe',
      'source_name' => 'Music Store',
      'color' => 'blue',
      'publish_date' => '2010',
      'on_spotify' => true
    }
  end

  subject { described_class.new(params) }

  describe '#initialize' do
    it 'assigns instance variables correctly' do
      expect(subject.title).to eq('Sample Album')
      expect(subject.genre_name).to eq('Pop')
      expect(subject.author_first_name).to eq('John')
      expect(subject.author_last_name).to eq('Doe')
      expect(subject.source_name).to eq('Music Store')
      expect(subject.color).to eq('blue')
      expect(subject.publish_date).to eq('2010')
      expect(subject.on_spotify).to be_truthy
    end

    it 'calls the parent class initialize' do
      expect_any_instance_of(Item).to receive(:initialize).with(
        'title' => 'Sample Album',
        'genre_name' => 'Pop',
        'author_first_name' => 'John',
        'author_last_name' => 'Doe',
        'source_name' => 'Music Store',
        'color' => 'blue',
        'publish_date' => '2010'
      )
      described_class.new(params)
    end
  end

  describe '#can_be_archived?' do
    context 'when item can be archived and on Spotify' do
      before do
        allow(Time).to receive(:now).and_return(Time.new(2021))
        subject.on_spotify = true
      end

      it 'returns true' do
        expect(subject.send(:can_be_archived?)).to be_truthy
      end
    end

    context 'when item can be archived but not on Spotify' do
      before do
        allow(Time).to receive(:now).and_return(Time.new(2021))
        subject.on_spotify = false
      end

      it 'returns false' do
        expect(subject.send(:can_be_archived?)).to be_falsey
      end
    end

    context 'when item cannot be archived' do
      before do
        allow(Time).to receive(:now).and_return(Time.new(2015))
        subject.on_spotify = true
      end

      it 'returns false' do
        expect(subject.send(:can_be_archived?)).to be_falsey
      end
    end
  end
end
