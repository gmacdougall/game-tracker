class Instance < ActiveRecord::Base
  resourcify

  belongs_to :game
  has_many :scores

  attr_accessible :game_id, :play_date

  def name
    "#{play_date} - #{game.name}"
  end
end
