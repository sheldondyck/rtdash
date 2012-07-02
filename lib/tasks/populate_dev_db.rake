namespace :db do
  desc "Fill dev database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_system_users
    make_blogs
  end
end

def make_users
  admin = User.create!(:name => "Example Test User",
                       :email => "example@testemail.org",
                       :password => "foobar",
                       :password_confirmation => "foobar")
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@testemail.org"
    password  = "foobar"
    User.create!(:name => name,
                 :email => email,
                 :password => password,
                 :password_confirmation => password)
  end
end

def make_system_users
  admin = SystemUser.create!(:name => "Super User name",
                       :account => "super_user_account",
                       :password => "foobar",
                       :password_confirmation => "foobar")
  10.times do |n|
    name  = Faker::Name.name
    email = "super_user_account_#{n+1}"
    password  = "foobar"
    SystemUser.create!(:name => name,
                      :account => email,
                      :password => password,
                      :password_confirmation => password)
  end
end

def make_blogs
  SystemUser.all(:limit => 5).each do |user|
    50.times do |n|
      blog_attr = {
            :title => Faker::Lorem.sentence(10),
            :message => '<p>' + Faker::Lorem.paragraph(10) + '</p>' +
            '<p>' + Faker::Lorem.paragraph(5) + '</p>' +
            '<p>' + Faker::Lorem.paragraph(7) + '</p>',
            :instance => '2012-01-01T00:00:00',
            :url => "blog_url_#{n}"}
      user.blogs.create!(blog_attr)
    end
  end
end

def make_microposts
  User.all(:limit => 6).each do |user|
    50.times do
      content = Faker::Lorem.sentence(5)
      user.microposts.create!(:content => content)
    end
  end
end

def make_relationships
  users = User.all
  user  = users.first
  following = users[1..50]
  followers = users[3..40]
  following.each { |followed| user.follow!(followed) }
  followers.each { |follower| follower.follow!(user) }
end

