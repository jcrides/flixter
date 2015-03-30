FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "guy#{n}@emailbistro.com" }
    password "thepassword"
    password_confirmation "thepassword"
  end

end
