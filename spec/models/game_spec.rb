describe Game do
  describe '.bgg_url' do
    it 'gives a url to boardgamegeek for this game' do
      subject.bgg_id = '12321'
      subject.bgg_url.should == 'http://boardgamegeek.com/boardgame/12321'
    end
  end
end
