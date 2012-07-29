class Instance < ActiveRecord::Base
  resourcify

  belongs_to :game
  has_many :scores
  accepts_nested_attributes_for :scores

  validates :play_date, presence: true
  validates :game_id, presence: true

  attr_accessible :game_id, :play_date, :scores_attributes

  def player_score(player)
    scores.each { |s| return s if s.player == player }
    nil
  end

  def player_won?(player)
    winning_scores.include?(player_score(player))
  end

  def name
    "#{play_date} - #{game.name}"
  end

  def players
    scores.map { |s| s.player }
  end

  def winning_scores
    scores.inject([]) do |winners, score|
      winners << score if score.score == best_score
      winners
    end
  end

  def remove_empty_scores!
    scores.each do |score|
      scores.delete score if score.score.nil?
    end
  end

  private
  def best_score
    scores.inject(nil) { |best, score| best = better_score(score.score, best) }
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
