require_relative '../game'

RSpec.describe Game do
  let(:game_params) do
    {
      'title' => 'Game Title',
      'genre_name' => 'Genre',
      'author_first_name' => 'John',
      'author_last_name' => 'Doe',
      'source_name' => 'Source',
      'color' => 'Red',
      'publish_date' => Time.now,
      'multiplayer' => true,
      'last_played_at' => '2021' # Update with a valid string date
    }
  end
  let(:game) { Game.new(game_params) }

  describe '#can_be_archived?' do
    context 'when the game is not eligible for archiving' do
      it 'returns false' do
        allow(Time).to receive(:now).and_return(Time.new(2022, 7, 2)) # Stub Time.now to return a fixed time

        expect(game.can_be_archived?).to be false
      end
    end
  end
end
