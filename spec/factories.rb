# By using the symbol ':user', we get Factory Girl to simulate the User model.
FactoryGirl.define do
  factory :user do
    name                  "Sheldon Van Dyck"
    email                 "sheldon@example.com"
    password              "foobar"
  end
end
