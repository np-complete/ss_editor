FactoryGirl.define do
  factory :dialog do
    story
    character
    face { character.faces.sample }
    sequence(:line_num) { |n| n }
    sequence(:message) { |n| "message_#{n}" }
  end
end
