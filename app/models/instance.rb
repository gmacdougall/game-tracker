class Instance < ActiveRecord::Base
  resourcify

  belongs_to :game
  has_many :scores
  accepts_nested_attributes_for :scores

  validates :play_date, presence: true
  validates :game_id, presence: true

  attr_accessible :game_id, :play_date, :scores_attributes

  def name
    "#{play_date} - #{game.name}"
  end

  def winners
    winners = []
    scores.each do |score|
      winners << score.player if score.score == best_score
    end
    winners
  end

  private
  def best_score
    best_score = nil
    scores.each do |score|
      best_score = better_score(score.score, best_score)
    end
    best_score
  end

  def better_score s1, s2
    if s1.nil?
      s2
    elsif s2.nil?
      s1
    elsif game.high_score_win?
      s1 > s2 ? s1 : s2
    else
      s1 > s2 ? s2 : s1
    end
  end
end
