require 'rspec'
require_relative '../item'

RSpec.describe Item do
  let(:params) do
    {
      'title' => 'Sample Title',
      'genre_name' => 'Sample Genre',
      'author_first_name' => 'John',
      'author_last_name' => 'Doe',
      'source_name' => 'Sample Source',
      'color' => 'red',
      'publish_date' => '2010'
    }
  end

  subject { described_class.new(params) }

  describe '#initialize' do
    it 'assigns instance variables correctly' do
      expect(subject.title).to eq('Sample Title')
      expect(subject.genre_name).to eq('Sample Genre')
      expect(subject.author_first_name).to eq('John')
      expect(subject.author_last_name).to eq('Doe')
      expect(subject.source_name).to eq('Sample Source')
      expect(subject.color).to eq('red')
      expect(subject.publish_date).to eq('2010')
      expect(subject.archived).to be_falsey
      expect(subject.label).to be_an_instance_of(Label)
      expect(subject.genre).to be_an_instance_of(Genre)
      expect(subject.author).to be_an_instance_of(Author)
      expect(subject.source).to be_an_instance_of(Source)
    end
  end

  describe '#move_to_archive' do
    context 'when item can be archived' do
      before do
        allow(Time).to receive(:now).and_return(Time.new(2021))
      end

      it 'sets archived to true' do
        expect { subject.move_to_archive }.to change { subject.archived }.from(false).to(true)
      end

      it 'prints the correct message' do
        expect { subject.move_to_archive }.to output("Moving Sample Title to archive\n").to_stdout
      end
    end

    context 'when item cannot be archived' do
      before do
        allow(Time).to receive(:now).and_return(Time.new(2015))
      end

      it 'does not change archived state' do
        expect { subject.move_to_archive }.not_to(change { subject.archived })
      end

      it 'prints the correct message' do
        expect { subject.move_to_archive }.to output("Can't move Sample Title to archive\n").to_stdout
      end
    end
  end

  describe '#can_be_archived?' do
    context 'when publish_date is more than 10 years ago' do
      before do
        allow(Time).to receive(:now).and_return(Time.new(2021))
      end

      it 'returns true' do
        expect(subject.can_be_archived?).to be_truthy
      end
    end

    context 'when publish_date is within 10 years' do
      before do
        allow(Time).to receive(:now).and_return(Time.new(2015))
      end

      it 'returns false' do
        expect(subject.can_be_archived?).to be_falsey
      end
    end
  end
end
