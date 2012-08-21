FactoryGirl.define do
  factory :face do
    character
    user
    sequence(:name) { |n| "name_#{n}" }
  end
end
