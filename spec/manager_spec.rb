# frozen_string_literal: true

require './lib/manager.rb'
require './lib/player.rb'

describe GameManager do
  describe '#initialize' do
    let(:game) { GameManager.new([Player.new('Fernando'), Player.new('Ahmed')]) }

    it 'should initialize an instance of the GameManager class' do
      expect(game).to be_an_instance_of(GameManager)
    end

    it 'should initialize an instance of the GameManager class' do
      expect(!game).not_to be_an_instance_of(GameManager)
    end
  end

  describe '#set_input' do
    let(:inp) { GameManager.new([Player.new('Fernando')]) }
    it 'inserts player input to a cell on the board' do
      board = (1..9).to_a
      expect(inp.set_input(board[1])).to eql(:X)
    end

    it 'should not insert the same player input to a filled cell on the board' do
      board = (1..9).to_a
      expect(inp.set_input(board[1])).not_to eql(:O)
    end
  end

  describe '#valid_move?' do
    let(:pos) { GameManager.new([Player.new('Fernando')]) }
    it 'checks if the position on the board is valid' do
      expect(pos.valid_move?(3)).to eql(true)
    end

    it 'checks if the position on the board is not valid' do
      expect(pos.valid_move?(10)).not_to eql(true)
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

    it ' should not define a constant WIN_COMBINATIONS with arrays for each win combination' do
      expect(GameManager::WIN_COMBINATIONS.size).not_to eq(9)

      expect(GameManager::WIN_COMBINATIONS).not_to include([0,1,4])
      expect(GameManager::WIN_COMBINATIONS).not_to include([2,4,5])
      expect(GameManager::WIN_COMBINATIONS).not_to include([6,3,2])
      expect(GameManager::WIN_COMBINATIONS).not_to include([0,1,6])
      expect(GameManager::WIN_COMBINATIONS).not_to include([1,6,7])
      expect(GameManager::WIN_COMBINATIONS).not_to include([4,4,8])
      expect(GameManager::WIN_COMBINATIONS).not_to include([0,2,6])
      expect(GameManager::WIN_COMBINATIONS).not_to include([6,5,3])
    end
  end

  describe '#space_filled?' do
  let(:game) { GameManager.new([Player.new('Fernando'), Player.new('Ahmed')]) }
    context 'Current space = filled'
    it 'checks if a board position has X or O' do
      game.set_input(1, :X)
      expect(game.space_filled?(1)).to eq(true)
    end

    context 'Current space = empty'
    it 'checks if a board position has X or O' do
      game.set_input(1, ' ')
      expect(game.space_filled?(3)).to eql(false)
    end
  end
end
