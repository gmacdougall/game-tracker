class Score < ActiveRecord::Base
  resourcify

  belongs_to :instance
  belongs_to :player

  attr_accessible :instance_id, :player_id, :score

  def win?
    instance.winning_scores.include? self
  end

  def excluded?
    instance.exclude?
  end

  def result
    if excluded?
      return 'X'
    elsif win?
      return 'W'
    else
      return 'L'
    end
  end

  # Doesn't play nice with mass assign from form
  #validates :instance_id, presence: true
  validates :player_id, presence: true
  validates :score, presence: true
end
