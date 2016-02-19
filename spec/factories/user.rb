FactoryGirl.define do 
  factory :user do
  	name                   "test"
    email                  "test@example.com"
    password               "passtest"
    password_confirmation  "passtest"
    confirmed_at Time.now	
  end
end