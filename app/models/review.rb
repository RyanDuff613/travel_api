class Review < ApplicationRecord
  validates_presence_of :user_name, :rating, :content, :country, :city

  # def self.search(params)
  #   @reviews = Review.find[params]
  #   json_response(@reviews)
  # end

  scope :country_reviews, -> (country_name) {where(country: country_name)}
end