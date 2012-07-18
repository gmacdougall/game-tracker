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
  let(:player1) { FactoryGirl.build :player, first_name: "Player", last_name: "One" }
  let(:player2) { FactoryGirl.build :player, first_name: "Player", last_name: "Two" }
  let(:player3) { FactoryGirl.build :player, first_name: "Player", last_name: "Three" }

  describe '.winners' do
    let(:score1) { 10 }
    let(:score2) { 8 }
    let(:score3) { 2 }

    before(:each) do
      instance.scores = [
        FactoryGirl.build(:score, instance: instance, player: player1, score: score1),
        FactoryGirl.build(:score, instance: instance, player: player2, score: score2),
        FactoryGirl.build(:score, instance: instance, player: player3, score: score3)
      ]
    end

    context "when high score wins" do
      context "when single winner" do
        its(:winners) { should == [player1] }
      end

      context "when multiple winners" do
        let(:score2) { score1 }
        its(:winners) { should =~ [player1, player2] }
      end
    end

    context "when low score wins" do
      let(:game) { FactoryGirl.build :formula_de }

      context "when single winner" do
        its(:winners) { should == [player3] }
      end

      context "when multiple winners" do
        let(:score2) { score3 }
        its(:winners) { should =~ [player2, player3] }
      end
    end
  end
end
