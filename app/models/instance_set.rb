class InstanceSet
  def initialize(instances)
    @instances = instances
  end

  def players
    @instances.map { |i| i.players }.flatten.uniq
  end

  def wins(player)
    @instances.inject(0) do |wins, instance|
      instance.player_won?(player) && !instance.exclude? ? wins + 1 : wins
    end
  end

  def plays(player)
    @instances.inject(0) do |plays, instance|
      instance.players.include?(player) ? plays + 1 : plays
    end
  end

  def losses(player)
    plays(player) - (wins(player) + excluded(player))
  end

  def excluded(player)
    @instances.inject(0) do |x, instance|
      instance.played_by?(player) && instance.exclude? ? x + 1 : x
    end
  end

  def statistics(player)
    InstanceSetStatistics.new(self, player)
  end
end
