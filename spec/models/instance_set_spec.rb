describe InstanceSet do

  let(:instance0) do
    i = double :instance
    players = [player0, player2]
    i.stub(:players) { players }
    i.stub!(:player_won?) { |player| player == player2 }
    i.stub!(:played_by?) { |player| players.include? player }
    i.stub(:exclude?) { false }
    i
  end

  let(:instance1) do
    i = double :instance
    players = [player1, player2]
    i.stub(:players) { [player1, player2] }
    i.stub!(:player_won?) { |player| player == player1 }
    i.stub!(:played_by?) { |player| players.include? player }
    i.stub(:exclude?) { false }
    i
  end

  let(:instance2) do
    i = double :instance
    players = [player1, player2]
    i.stub(:players) { players }
    i.stub(:player_won?) { true }
    i.stub(:exclude?) { true }
    i.stub!(:played_by?) { |player| players.include? player }
    i
  end

  let(:player0) { double :player }
  let(:player1) { double :player }
  let(:player2) { double :player }

  subject { InstanceSet.new [instance0, instance1, instance2] }

  describe '.players' do
    it 'returns all players involved in instances' do
      subject.players.should =~ [player0, player1, player2]
    end
  end

  describe '.wins' do
    it 'returns zero when not involved in any games' do
      subject.wins(Player.new).should == 0
    end

    it 'returns the count of all games the player won' do
      subject.wins(player2).should == 1
    end
  end

  describe '.plays' do
    it 'returns zero when not involved in any games' do
      subject.plays(Player.new).should == 0
    end

    it 'retuns the count of games the players were involved in' do
      subject.plays(player2).should == 3
    end
  end

  describe '.losses' do
    it 'returns zero when not involved in any games' do
      subject.losses(Player.new).should == 0
    end

    it 'returns the count of games the player did not win that were not excluded' do
      subject.losses(player2).should == 1
    end
  end

  describe '.excluded' do
    it 'is zero when not involved in any games' do
      subject.excluded(Player.new).should == 0
    end

    it 'is zero if the player is not involved in any excluded games' do
      subject.excluded(player0).should == 0
    end

    it 'is the count of games the player was involved in that were excluded' do
      subject.losses(player2).should == 1
    end
  end

  describe '.statistics' do
    it 'gets a statistics object' do
      subject.statistics(Player.new).should be_a(InstanceSetStatistics)
    end
  end
end
