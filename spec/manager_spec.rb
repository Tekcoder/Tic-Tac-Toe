# frozen_string_literal: true

require './lib/manager.rb'
require './lib/player.rb'

describe GameManager do
  describe '#initialize' do
    let(:game) { GameManager.new([Player.new('Fernando'), Player.new('Ahmed')]) }

    it 'should initialize an instance of the GameManager class' do
      expect(game).to be_an_instance_of(GameManager)
    end
  end

  describe '#set_input' do
    let(:inp) { GameManager.new([Player.new('Fernando')]) }
    it 'inserts player input to a cell on the board' do
      board = (1..9).to_a
      expect(inp.set_input(board[1])).to eql(:X)
    end
  end

  describe '#valid_move?' do
    let(:pos) { GameManager.new([Player.new('Fernando')]) }
    it 'checks if the position on the board is valid' do
      expect(pos.valid_move?(3)).to eql(true)
    end
  end

  describe '#won?' do
    let(:board) { GameManager.new((1..9).to_a) }
    it 'Should return true if the 1st row is filled with the same symbol' do
      expect(board.won?(['X', 'X', 'X', 4, 5, 6, 7, 8, 9])).to eql(true)
    end
  end
end
