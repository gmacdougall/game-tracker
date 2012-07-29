describe InstanceSetStatistics do
  describe '.winning_percentage' do
    let(:plays) { 4 }
    let(:wins) { 1 }
    let(:losses) { 2 }
    let(:excluded) { 1 }

    let(:instance_set) do
      set = InstanceSet.new nil
      set.stub(:plays) { plays }
      set.stub(:wins) { wins }
      set.stub(:losses) { losses }
      set.stub(:excluded) { excluded }
      set
    end

    subject { InstanceSetStatistics.new instance_set, double(:player) }

    it 'is wins divided by (plays - excluded' do
      subject.winning_percentage.should be_within(0.00001).of(1 / 3.0)
    end
  end
end
