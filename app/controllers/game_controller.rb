class GameController < ApplicationController

  def create
    game = Game.create!({player1: params[:player1], player2: params[:player2]})
    game.create_deck
    {
      player: starting_player,
      game_id: game.id,
      init_card: game.turn
    }
  end

  def pick_card
    game = Game.find(params[:game_id])
    @card = game.pick_card(Player.find_by_user_name_eq(params[:player]))
  end

end
