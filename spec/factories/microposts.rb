# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :micropost do
    content "MyString"
    user
  end
end
