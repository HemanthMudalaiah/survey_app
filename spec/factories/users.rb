FactoryGirl.define do
  factory :user do
    email                 "mbrown@yahoo.com"
    password               "foobar123"
    password_confirmation  "foobar123"
  end
end