require './lib/manager.rb'
require './lib/player.rb'

describe GameManager do
  describe '#initialize' do
  let(:game) { GameManager.new([Player.new('Fernando'), Player.new('Ahmed')]) }
  
    it 'should initialize an instance of the GameManager class' do
      expect(game).to be_an_instance_of(GameManager)
    end
  end

#   describe '#valid_move?' do
  
# end

describe '#set_input' do
let(:board) { GameManager.new(board[1])}
it 'inserts X into a cell' do
  board = 1..9
  expect(board[0], "X").to eql(board[3], "X")
end
end
end

# before {@valid_move = Player.new("abc", "X").make_move?("#{pos}", Board.new)}

#     describe "#move_valid?" do
#         context "3 on the board" do
#             let(:pos) {"3"}
#             it "3 is a valid spot on the board" do
#                 expect(@valid_move).to eql(true)
#             end
#         end

#         def move_valid?(move)
#           correct_pos = ("1".."9").include?(move)
#           if correct_pos
#               is_not_occupied = pos[move.to_i - 1].eql?(move)
#           end
#           correct_pos and is_not_occupied
#       end
  