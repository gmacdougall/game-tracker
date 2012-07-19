class Player < ActiveRecord::Base
  resourcify

  has_many :scores

  attr_accessible :first_name, :last_name

  validates :first_name, presence: true
  validates :last_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
