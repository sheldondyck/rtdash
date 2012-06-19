# By using the symbol ':user', we get Factory Girl to simulate the User model.
FactoryGirl.define do
  factory :user do
    name                  "User Name"
    email                 "user@internet.com"
    password              "foobar"
  end

  factory :system_user do
    name                  "System User Name"
    account               "system_user"
    password              "foobar"
  end

  factory :blog do
    title                 "Blog Title"
    message               "Blog messge. Blog messge. Blog messge. Blog messge."
    instance              '2012-01-01T00:00:00'
    url                   'blog_url'
  end
end

FactoryGirl.define do
  sequence :email do |n| 
    "person-#{n}@example.com"
  end

  sequence :blog_title do |n| 
    "Blog Title #{n}"
  end

  sequence :blog_message do |n| 
    "Blog message #{n}"
  end
end
