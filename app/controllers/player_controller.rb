class PlayerController < ApplicationController

  before_filter: load_players

  def new
    @player = Player.new({name: params[:name], email: params[:email], params[:password]})
    if @player.save!
      "Successfully registered!.."
    else
      "Error in creation"
    end
  end

  def follow
    if @player1 and @player2
      UserFollow.create!({player1: @player1.id, player2: @player2.id, status:"requested"})
      "Requested Successfully"
    else
      "Error in Follow"
    end
  end

  def current_player
    @current_player # read it from session
  end

  def accept
    player    
  end

  private
    def load_players
      @player1 = Player.find_by_user_name(params[:player1_user_name])
      @player2 =  Player.find_by_user_name(params[:player2_user_name])
      
    end
end
