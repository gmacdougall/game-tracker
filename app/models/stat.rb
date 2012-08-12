class Stat < ActiveRecord::Base
  belongs_to :player
  belongs_to :game

  attr_accessible :excluded, :game, :losses, :player, :wins, :played

  def update
    results = Score.includes(:instance => [:game, :scores])
      .where(player_id: player.id, :instances => {game_id: game.id})
      .map { |s| s.result }
    self.wins = results.count('W')
    self.losses = results.count('L')
    self.excluded = results.count('X')
    self.played = results.count
    self
  end

  def update!
    update
    save! if played > 0
  end

  def self.update_all!
    Stat.delete_all
    Player.all.each do |player|
      Game.all.each do |game|
        stat = Stat.new player: player, game: game
        stat.update!
      end
    end
  end
end
