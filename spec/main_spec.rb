#  require './bin/main.rb'
#  require '.lib/manager.rb'

#  Rspec.describe UserInterface do
# #   describe '#display_board' do
# #       it 'prints arbitrary arrangements of the board' do
# #         board = ["X", "X", "X", "X", "O", "O", "X", "O", "O"]
# #         game = GameManager.new
# #         game.instance_variable_set(:@board, board)

# #         output = capture_puts{ game.display_board }

# #         expect(output).to include(" X | X | X ")
# #         expect(output).to include("-----------")
# #         expect(output).to include(" X | O | O ")
# #         expect(output).to include("-----------")
# #         expect(output).to include(" X | O | O ")


# #         board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
# #         game.instance_variable_set(:@board, board)

# #         output = capture_puts{ game.display_board }

# #         expect(output).to include(" X | O | X ")
# #         expect(output).to include("-----------")
# #         expect(output).to include(" O | X | X ")
# #         expect(output).to include("-----------")
# #         expect(output).to include(" O | X | O ")
# #       end
# #     end
# describe "#position" do
# it "should inform the current player to select a position on the board" do
#   expect((@game.current_player).position).to eql(:X)
# end

#     it "should inform the current player to select a position on the board" do
#       expect((!@game.current_player).position).not_to eql(:O)
#   end
# end
#   end