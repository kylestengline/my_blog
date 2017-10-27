# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Life.destroy_all
Code.destroy_all

unless User.find_by(email: "me@example.com")
  User.destroy_all
  User.create!(
    email: "me@example.com",
    password: "password",
    id: 1
  )
end

Life.create!(
  title: "The World Moves",
  content: "I've come to terms with the idea that the world move whether we want it to or not. I was standing in an apartment, moving out to a more 'permanent' situation, when I realized this. My old roommate was going through her things and going about her life while I was moving my things out. It was here, I..understood, the idea. It's a funny thing coming to terms with something. It's this very idea that drives me, it sends a fire through my limbs and brings them to life. This idea gives me the fuel to go after what I want in life. There's nothing more important than happyness. Nothing. Go after what you want. One day, I hope you'll realize the only thing standing in your way is yourself.",
  user_id: 1,
  created_at: "9/9/2017" 
)

Code.create!(
  title: "Code Things",
  content: "Code things forever and ever",
  user_id: 1,
  created_at: "9/10/2017" 
)

puts "Life posts created: #{Life.count}"
puts "Code posts created: #{Code.count}"
