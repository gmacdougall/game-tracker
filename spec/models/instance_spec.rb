require 'spec_helper'

describe Instance do
  subject { FactoryGirl.build :instance }
  describe '.name' do
    it 'contains the date and game name' do
      subject.name.should == '1985-10-26 - Agricola'
    end
  end
end
