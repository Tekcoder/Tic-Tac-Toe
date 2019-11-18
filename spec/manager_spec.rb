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

  describe '#turn_count' do
  let(:game) { GameManager.new([Player.new('Fernando'), Player.new('Ahmed')]) }
  it 'displays the counter for how many turns has been passed' do
    game.set_input(0, :X)
    game.set_input(1, :O)
    game.set_input(2, :X)
    game.set_input(3, :O)
    game.set_input(4, :X)
    expect(game.turn_count).to eql(5)
  end
end

describe '#full?' do
let(:game) { GameManager.new([Player.new('Fernando'), Player.new('Ahmed')]) }
    context 'The Board is not full'
    it 'Checks if all the positions in the board are occupied' do
      game.set_input(0, :X)
      game.set_input(1, :O)
      game.set_input(2, :X)
      game.set_input(3, :O)
      expect(game.full?).to eq(false)
    end

    context 'The Board is filled up'
    it 'Checks if all the positions in the board are occupied' do
      game.set_input(0, :X)
      game.set_input(1, :O)
      game.set_input(2, :X)
      game.set_input(3, :O)
      game.set_input(4, :X)
      game.set_input(5, :O)
      game.set_input(6, :X)
      game.set_input(7, :O)
      game.set_input(8, :X)
      expect(game.full?).to eq(true)
    end
  end

  describe '#won?' do
  let(:game) { GameManager.new([Player.new('Fernando'), Player.new('Ahmed')]) }
    it 'Winning combination - Top horizontal' do
      game.set_input(0, :X)
      game.set_input(1, :X)
      game.set_input(2, :X)
      expect(game.won?).to eq([0, 1, 2])
    end

    it 'Winning combination - First Diagonal' do
      game.set_input(0, :X)
      game.set_input(4, :X)
      game.set_input(8, :X)
      expect(game.won?).to eq([0, 4, 8])
    end

    it 'Winning combination -Second Diagonal' do
      game.set_input(6, :X)
      game.set_input(4, :X)
      game.set_input(2, :X)
      expect(game.won?).to eq([6, 4, 2])
    end

    it 'Winning combination - Middle horizontal' do
      game.set_input(3, :X)
      game.set_input(4, :X)
      game.set_input(5, :X)
      expect(game.won?).to eq([3, 4, 5])
    end

    it 'Winning combination -Bottom horizontal' do
      game.set_input(6, :X)
      game.set_input(7, :X)
      game.set_input(8, :X)
      expect(game.won?).to eq([6, 7, 8])
    end

    it 'Winning combination - Left vertical' do
      game.set_input(0, :O)
      game.set_input(3, :O)
      game.set_input(6, :O)
      expect(game.won?).to eq([0, 3, 6])
    end

    it 'Middle vertical win combination' do
      game.set_input(1, :X)
      game.set_input(4, :X)
      game.set_input(7, :X)
      expect(game.won?).to eq([1, 4, 7])
    end

    it 'Right vertical win combination' do
      game.set_input(2, :O)
      game.set_input(5, :O)
      game.set_input(8, :O)
      expect(game.won?).to eq([2, 5, 8])
    end
  end

  describe '#draw?' do
  let(:game) { GameManager.new([Player.new('Fernando'), Player.new('Ahmed')]) }
    it 'Checks if there is a draw after all positions are occupied and no win' do
      game.set_input(5, :X)
      game.set_input(1, :O)
      game.set_input(2, :X)
      game.set_input(8, :O)
      game.set_input(6, :X)
      game.set_input(4, :O)
      game.set_input(7, :X)
      game.set_input(3, :O)
      game.set_input(0, :X)
      expect(game.draw?).to eq(true)
    end
  end

  describe '#over?' do
  let(:game) { GameManager.new([Player.new('Fernando'), Player.new('Ahmed')]) }
    context 'The Board is full but there is no winning combination condition met'
    it 'Checks for won? or full? or draw?, returns true if game is over' do
      game.set_input(0, :X)
      game.set_input(1, :O)
      game.set_input(2, :X)
      game.set_input(3, :X)
      game.set_input(4, :X)
      game.set_input(5, :O)
      game.set_input(6, :O)
      game.set_input(7, :X)
      game.set_input(8, :O)
      expect(game.over?).to eq(true)
    end

    context 'The Board is full and a winning combination is detected'
    it 'Checks for won? or full? or draw?, returns true if game is over' do
      game.set_input(0, :O)
      game.set_input(1, :O)
      game.set_input(2, :X)
      game.set_input(3, :X)
      game.set_input(4, :X)
      game.set_input(5, :X)
      game.set_input(6, :O)
      game.set_input(7, :X)
      game.set_input(8, :O)
      expect(game.over?).to eq(game.won?)
    end
  end

  describe '#current_player' do
  let(:game) { GameManager.new([Player.new('Fernando'), Player.new('Ahmed')]) }
    it 'displays the current players symbol based on turn count, X if even, O if odd' do
      game.set_input(0, :X)
      expect(game.current_player).to eql(:O)
    end

    it 'displays the current players symbol based on turn count, X if even, O if odd' do
      game.set_input(0, :X)
      game.set_input(1, :O)
      expect(game.current_player).to eql(:X)
    end
  end

  describe '#board_index' do
  let(:game) { GameManager.new([Player.new('Fernando'), Player.new('Ahmed')]) }
  it 'displays the original value of the input.For instance, Instead of 2, the system sees 1' do
  expect(game.board_index(1)).to eql(0)
  expect(game.board_index(2)).to eql(1)
  expect(game.board_index(3)).to eql(2)
  expect(game.board_index(4)).to eql(3)
  expect(game.board_index(5)).to eql(4)
  expect(game.board_index(6)).to eql(5)
  expect(game.board_index(7)).to eql(6)
  expect(game.board_index(8)).to eql(7)
  expect(game.board_index(9)).to eql(8)
  end

  it "converts the user's input (a string) into an integer" do
    expect(game.board_index("1")).to be_an(Integer)
  end

  it "accepts the user's input (a string) as an argument" do
    expect{game.board_index}.to raise_error(ArgumentError)
  end
  end

  describe '#winner?' do
  let(:game) { GameManager.new([Player.new('Fernando'), Player.new('Ahmed')]) }
    context 'Winner is O'
    it 'checks if the winner is O' do
      game.set_input(5, :X)
      game.set_input(1, :O)
      game.set_input(2, :X)
      game.set_input(4, :O)
      game.set_input(6, :X)
      game.set_input(7, :O)
      game.set_input(8, :X)
      game.set_input(3, :O)
      game.set_input(0, :X)
      expect(game.winner? == :O).to eq(true)
    end

    context 'Winner is X'
    it 'checks if the winner is X' do
      game.set_input(0, :X)
      game.set_input(1, :O)
      game.set_input(3, :X)
      game.set_input(4, :O)
      game.set_input(6, :X)
      game.set_input(5, :O)
      game.set_input(2, :x)
      game.set_input(7, :X)
      game.set_input(8, :O)
      expect(game.winner? == :X).to eq(true)
    end
  end
end
