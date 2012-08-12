class Game < ActiveRecord::Base
  resourcify

  has_many :instances
  has_many :stats

  validates :name, presence: true
  validates_inclusion_of :exclude_from_stats, in: [true, false]
  validates_inclusion_of :high_score_win, in: [true, false]

  attr_accessible :bgg_id, :exclude_from_stats, :high_score_win, :name

  def bgg_url
    "http://boardgamegeek.com/boardgame/#{bgg_id}"
  end
end
