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

  describe 'WIN_COMBINATIONS' do
    it 'defines a constant WIN_COMBINATIONS with arrays for each win combination' do
      expect(GameManager::WIN_COMBINATIONS.size).to eq(8)

      expect(GameManager::WIN_COMBINATIONS).to include([0,1,2])
      expect(GameManager::WIN_COMBINATIONS).to include([3,4,5])
      expect(GameManager::WIN_COMBINATIONS).to include([6,7,8])
      expect(GameManager::WIN_COMBINATIONS).to include([0,3,6])
      expect(GameManager::WIN_COMBINATIONS).to include([1,4,7])
      expect(GameManager::WIN_COMBINATIONS).to include([2,5,8])
      expect(GameManager::WIN_COMBINATIONS).to include([0,4,8])
      expect(GameManager::WIN_COMBINATIONS).to include([6,4,2])
    end
  end

end
