require 'spec_helper'

describe Player do
  subject { build :player }
  describe '.name' do
    context "when last name specified" do
      it 'is first name + last name' do
        subject.name.should == 'Uwe Rosenberg'
      end
    end

    context "when last name is nil" do
      subject { build :player, first_name: "Reiner", last_name: nil }

      it 'is only the first name' do
        subject.name.should == "Reiner"
      end
    end
  end
end
