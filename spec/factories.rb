FactoryGirl.define do
  factory :user do
    id 1
    email "test@test.com"
    password "1234567890"
    password_confirmation "1234567890"
    name "Test"
  end
end