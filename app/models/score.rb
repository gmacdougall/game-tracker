class Score < ActiveRecord::Base
  resourcify

  belongs_to :instance
  belongs_to :player

  attr_accessible :instance_id, :player_id, :score
end
