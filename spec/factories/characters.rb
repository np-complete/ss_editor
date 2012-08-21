FactoryGirl.define do
  factory :character do
    sequence(:name) { |n| "name_#{n}" }

    after :create do |character, eval|
      FactoryGirl.create_list :face, 5, character: character
    end
  end
end
