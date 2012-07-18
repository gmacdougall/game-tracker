require 'spec_helper'

describe Player do
  subject { FactoryGirl.build :player }
  describe '.name' do
    it 'is first name + last name' do
      subject.name.should == 'Uwe Rosenberg'
    end
  end
end
