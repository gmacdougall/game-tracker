# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    name "Game"
    high_score_win true
    exclude false

    factory :agricola do
      name "Agricola"
    bgg_id 31260
    end

    factory :formula_de do
      name "Formula De"
      bgg_id 173
      high_score_win false
    end
  end
end
