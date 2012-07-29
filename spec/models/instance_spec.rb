require 'spec_helper'

describe Instance do
  subject { instance }
  describe '.name' do
    it 'contains the date and game name' do
      subject.name.should == '1985-10-26 - Agricola'
    end
  end

  let(:game) { FactoryGirl.build :agricola }
  let(:instance) { FactoryGirl.build :instance, game: game }

  let(:players) do
    [
      FactoryGirl.build(:player, first_name: "Player", last_name: "One"),
      FactoryGirl.build(:player, first_name: "Player", last_name: "Two"),
      FactoryGirl.build(:player, first_name: "Player", last_name: "Three"),
    ]
  end
  let(:score0) { 10 }
  let(:score1) { 8 }
  let(:score2) { 2 }
  let(:scores) do
    [
      FactoryGirl.build(:score, instance: instance, player: players[0], score: score0),
      FactoryGirl.build(:score, instance: instance, player: players[1], score: score1),
      FactoryGirl.build(:score, instance: instance, player: players[2], score: score2)
    ]
  end

  before(:each) do
    instance.scores = scores
  end

  context "when high score wins" do
    describe '.winning_scores' do
      context "when single winner" do
        its(:winning_scores) { should == [scores[0]] }
      end

      context "when multiple winners" do
        let(:score1) { 10 }
        its(:winning_scores) { should =~ [scores[0], scores[1]] }
      end
    end

    context "when low score wins" do
      let(:game) { FactoryGirl.build :formula_de }

      context "when single winner" do
        its(:winning_scores) { should == [scores[2]] }
      end

      context "when multiple winners" do
        let(:score1) { score2 }
        its(:winning_scores) { should =~ [scores[1], scores[2]] }
      end
    end
  end

  describe '.remove_empty_scores' do
    before(:each) { subject.remove_empty_scores! }
    context 'when no empty scores' do
      it { should have(3).scores }
    end

    context 'when 1 empty score' do
      let(:score1) { nil }
      it { should have(2).scores }
      its(:scores) { should_not include(scores[1]) }
    end
  end
end
