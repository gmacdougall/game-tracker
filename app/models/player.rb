class Player < ActiveRecord::Base
  resourcify

  has_many :scores

  attr_accessible :first_name, :last_name

  def name
    "#{first_name} #{last_name}"
  end
end
