class Game < ApplicationRecord
  belongs_to :player1, :class_name => "Player"
  belongs_to :player2, :class_name => "Player"

  def create_deck
    @cards = Card.all  # we need to store this into redis, for now assume this is constsnt
    starting_player = [params[:player1], params[:player2]].sample
  end

  def turn
    @turn_player ||= [player1, player2].sample # initializing first turn
    @turn_player = @turn_player == player1 ? player2 : player1
  end

  def pick_card player
    card = @cards.shuffle.delete_at(0)
    GameHistory.create({game_id: self.id, player_id: player.id, card_id: card.id})
    card
  end

end
