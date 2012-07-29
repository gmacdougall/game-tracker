class InstanceSet
  def initialize(instances)
    @instances = instances
  end

  def players
    @instances.map { |i| i.players }.flatten.uniq
  end

  def wins(player)
    @instances.inject(0) do |wins, instance|
      instance.player_won?(player) ? wins + 1 : wins
    end
  end

  def plays(player)
    @instances.inject(0) do |plays, instance|
      instance.players.include?(player) ? plays + 1 : plays
    end
  end
end
