class PlayerController < ApplicationController

  before_action :load_players, except: [:new]
  before_action :current_player, only: [:accept, :friend_list]

  def new
    @player = Player.new()
  end

  def create
    @player = Player.new({name: params[:name], email: params[:email], password: params[:password]})
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
    request = UserFollow.find_by_player2_and_player1(@current_player, params[:player])
    request.status = "accepted"
    UserFollow.create!({player1: @current_player, player2: params[:player], status = "accepted"})
  end

  def friend_list
    @friends = UserFollow.find_by_player1_and_status(@current_player,"accepted")
    @firend_requests = UserFollow.find_by_player2_and_status(@current_player,"requested")
  end

  private
    def load_players
      @player1 = Player.find_by_user_name(params[:player1_user_name])
      @player2 =  Player.find_by_user_name(params[:player2_user_name])
      
    end
end
