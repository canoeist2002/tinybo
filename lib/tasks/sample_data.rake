namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    99.times do |n|
      name  = Faker::Name.name
      email = Faker::Internet.email
      password  = "password123"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end

  task microposts: :environment do
    users = User.all(limit: 10)
    20.times do
      content = Faker::Lorem.sentence(7)
      users.each{ |user| user.microposts.create!(content: content) }
    end
  end

  task relationships: :environment do
    users = User.all
    user  = users.first
    followed_users = users[2..10]
    followers      = users[3..15]
    followed_users.each { |followed| user.follow!(followed) }
    followers.each      { |follower| follower.follow!(user) }
  end
end