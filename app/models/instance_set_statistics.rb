class InstanceSetStatistics
  def initialize(instance_set, player)
    @instance_set = instance_set
    @player = player
  end

  def winning_percentage
    @instance_set.wins(@player) / (@instance_set.plays(@player) - @instance_set.excluded(@player)).to_f
  end

end
