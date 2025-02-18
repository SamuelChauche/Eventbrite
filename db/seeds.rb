require 'faker'

# Supprimer les enregistrements existants pour éviter les doublons
Attendance.delete_all
Event.delete_all
User.delete_all

# Créer des utilisateurs fictifs
10.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 6),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph
  )
end
users = User.all

# Créer des événements fictifs
User.all.each do |user|
  3.times do
    Event.create!(
      start_date: Faker::Date.forward(days: 30),
      duration: Faker::Number.between(from: 1, to: 5) * 60, # Durée en minutes
      title: Faker::Lorem.sentence(word_count: 3),
      description: Faker::Lorem.paragraph,
      price: Faker::Number.between(from: 10, to: 100),
      location: Faker::Address.city,
      user_id: user.id
    )
  end
end

# Créer des participations fictives
Event.all.each do |event|
  5.times do
    Attendance.create!(
      event_id: event.id,
      user_id: users.sample.id,
      stripe_customer_id: Faker::Alphanumeric.alphanumeric(number: 10),
      created_at: Faker::Date.between(from: 2.days.ago, to: Date.today),
      updated_at: Faker::Date.between(from: 2.days.ago, to: Date.today)
    )
  end
end

puts "Seed terminée !"
