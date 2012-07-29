describe InstanceSet do

  let(:instance0) do
    i = double :instance
    i.stub(:players) { [player0, player2] }
    i.stub!(:player_won?) { |player| player == player2 }
    i
  end

  let(:instance1) do
    i = double :instance
    i.stub(:players) { [player1, player2] }
    i.stub!(:player_won?) { |player| player == player1 }
    i
  end

  let(:player0) { double :player }
  let(:player1) { double :player }
  let(:player2) { double :player }

  subject { InstanceSet.new [instance0, instance1] }

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
      subject.plays(player2).should == 2
    end
  end

end
