FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "name_#{n}" }
    sequence(:openid_url) { |n| "mail_#{n}@example.com" }
    profile "profile profile profile"
  end
end
