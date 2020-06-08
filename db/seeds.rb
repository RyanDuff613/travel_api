# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
class Seed

  def self.begin
    seed = Seed.new
    seed.generate_reviews
  end

  def generate_reviews
    20.times do |i|
      review = Review.create!(
        user_name: Faker::FunnyName.two_word_name,
        content: Faker::Lorem.sentence(word_count: 18),
        rating: Faker::Number.between(from: 1, to: 5),
        country: Faker::WorldCup.team,
        city: Faker::Nation.capital_city
      )
      puts "Review #{i}: Reviewer is #{review.user_name} and review is '#{review.content}'."
    end
  end
end

Seed.begin