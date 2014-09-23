namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example Admin User",
                         email: "example_admin@railstutorial.jp",
                         password: "foobar",
                         password_confirmation: "foobar",
                         admin: true)

    User.create!(name: "Example User2",
                 email: "example_user@railstutorial.jp",
                 password: "foobar",
                 password_confirmation: "foobar")

    6.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.jp"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all()
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end
  end
end
