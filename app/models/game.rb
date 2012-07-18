class Game < ActiveRecord::Base
  resourcify

  has_many :instances

  attr_accessible :bgg_id, :exclude, :high_score_win, :name
end
