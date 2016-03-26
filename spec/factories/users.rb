FactoryGirl.define do
  factory :user do
    email "abc@example.com"
    password "password"
    password_confirmation "password"
  	authentication_token "abcdefgh12345678"
  end
end
