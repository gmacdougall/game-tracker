# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    name "Agricola"
    bgg_id 31260
    high_score_win true
    exclude false
  end
end
