FactoryGirl.define do
  factory :story do
    sequence(:title) { |n| "title_#{n}" }
    user

    ignore do
      dialogs 0
    end

    after :create do |story, eval|
      FactoryGirl.create_list :dialog, eval.dialogs, story: story
    end
  end
end
