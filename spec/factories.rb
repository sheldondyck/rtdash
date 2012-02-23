# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "Sheldon Van Dyck"
  user.email                 "sheldon@example.com"
  user.password              "foobar"
end
