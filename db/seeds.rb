# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_params = { password: 'password', password_confirmation: 'password' }

# A user with no tasks or even any other data at all - an empty account
User.create(user_params.merge(username: 'user0', name: 'User 0', email: '0@user.com'))

(1..10).each do |i|
  user = User.create(user_params.merge(username: "user#{i}", name: "User #{i}", email: "#{i}@user.com"))

  # Open tasks
  (1..5).each do |i|
    user.tasks.create summary: Faker::Lorem.words(rand(3..8)).join(' '),
                      description: Faker::Lorem.paragraphs(rand(1..5)).join('\n'),
                      type: Task.types.values.sample
  end

  # Open and closed tasks
  (0..10).each do |i|
    user.tasks.create summary: Faker::Lorem.words(rand(3..8)).join(' '),
                      description: Faker::Lorem.paragraphs(rand(1..5)).join('\n'),
                      type: Task.types.values.sample,
                      closed: [true, false].sample
  end

  (0..2).each do |i|
    project = user.projects.create name: Faker::Commerce.product_name, type: Project.types.values.sample

    # Open tasks
    (1..5).each do |i|
      project.tasks.create summary: Faker::Lorem.words(rand(3..8)).join(' '),
                        description: Faker::Lorem.paragraphs(rand(1..5)).join('\n'),
                        type: Task.types.values.sample
    end

    # Open and closed tasks
    (0..20).each do |i|
      project.tasks.create summary: Faker::Lorem.words(rand(3..8)).join(' '),
                        description: Faker::Lorem.paragraphs(rand(1..5)).join('\n'),
                        type: Task.types.values.sample,
                        closed: [true, false].sample
    end
  end
end


