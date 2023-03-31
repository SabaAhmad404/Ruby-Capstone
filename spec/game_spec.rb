require_relative '../classes/game/game'

describe Game do
  context '#initialize' do
    it 'should return a game object' do
      game = Game.new('2010-03-10', 'yes', '2022-03-21')
      expect(game).to be_a_kind_of(Game)
    end
    it 'should return a game object with a multiplayer' do
      game = Game.new('2010-03-10', 'yes', '2022-03-21')
      publisher = game.instance_variable_get(:@multiplayer)
      expect(publisher).to eq('yes')
    end
  end

  context '#can_be_archive when called' do
    it 'should return false if @last_played_at > 2' do
      game = Game.new('2010-03-10', 'yes', '2022-03-21')
      result = game.can_be_archived?

      expect(result).to eq(false)
    end
  end
end
