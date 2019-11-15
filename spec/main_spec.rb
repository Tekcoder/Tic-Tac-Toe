require './bin/main.rb'

Rspec.describe UserInterface do
  describe '#turn' do
  it 'should not give each player a turn to play' do
  spot = gets.chomp
    spot = @game.board_index(spot)
  expect(@game.valid_move?(spot).turn).not_to eql(@game.set_input(spot, @game.current_player) && display_board)
end
end
end