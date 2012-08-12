class StatsController < ApplicationController
  skip_authorization_check
  respond_to :json

  def player
    @stats = Stat.where(player_id: params[:player]).limit(10)
  end
end
