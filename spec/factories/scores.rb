# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :score do
    instance_id 1
    player_id 1
    score "9.99"
  end
end
