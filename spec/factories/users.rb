# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "me@here.com"
    password "pass123"

  end

  factory :admin, class: User do
    email "admin@here.com"
    password "pass123"

    after(:build) do |user|
      user.add_role :admin
    end
  end
end
