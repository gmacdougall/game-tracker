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

  describe '.player_score' do
    it 'is false if the player was not involved in this game' do
      subject.player_score(Player.new).should be_false
    end

    it 'returns the matching score if the player was involved in the game' do
      subject.player_score(scores[1].player).should == scores[1]
    end
  end

  describe '.player_won?' do
    it 'is true if that player won the game' do
      subject.player_won?(players[0]).should be_true
    end
    it 'is false if that player did not win the game' do
      subject.player_won?(players[1]).should be_false
    end
    it 'is false if the player was not involved in the game' do
      subject.player_won?(Player.new).should be_false
    end
  end

  describe '.played_by?' do
    it 'is true if the player was involved in the game' do
      subject.played_by?(players[0]).should be_true
    end
    it 'is false if the player was not involved in the game' do
      subject.played_by?(Player.new).should be_false
    end
  end

  describe '.exclude?' do
    context "when game not flagged as excluded" do
      context "when all players win" do
        let(:score1) { 10 }
        let(:score2) { 10 }
        its(:exclude?) { should be_true }
      end
      context "when there is at least one winner and one non-winner" do
        its(:exclude?) { should be_false }
      end
    end

    context "when game flagged as excluded" do
      let(:game) { FactoryGirl.build :agricola, exclude_from_stats: true }
      its(:exclude?) { should be_true }
    end
  end
end
