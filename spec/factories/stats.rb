# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :stat do
    association :player
    association :game
    wins 2
    losses 3
    excluded 1
    played 6
  end
end
