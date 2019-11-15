# frozen_string_literal: true

require './lib/player.rb'

RSpec.describe Player do
  let(:player1) { Player.new('Mark') }
  let(:player2) { Player.new('Ariel') }

  describe '#initialize' do
    it 'assigns name to the first player 1' do
      expect(player1.name).to eql('Mark')
    end

      it 'should not assign name to the first player 1' do
        expect(!player1.name).not_to eql('Mark')
      end

    it 'assigns name to the second player 2' do
      expect(player2.name).to eql('Ariel')
    end

    it 'should not assign name to the second player 2' do
      expect(!player2.name).not_to eql('Ariel')
    end
  end
end
