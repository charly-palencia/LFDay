FactoryGirl.define do
  factory :user do
    id 1
    email "test@test.com"
    password "1234567890"
    password_confirmation "1234567890"
    name "Test"
  end

  factory :preference do
    like "test for input of preferences of user like"
    dislike "test for input of preferences of user - dislike"
    user_id 1
  end
end