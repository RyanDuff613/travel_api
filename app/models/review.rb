class Review < ApplicationRecord
  validates_presence_of :user_name, :rating, :content, :country, :city
  validates :rating, numericality: true
  scope :country_reviews, -> (country_name) {where(country: country_name)}
  scope :city, -> (city_name) {where(city: city_name)}
  scope :rating, -> (provided_rating) {where(rating: provided_rating)}
  scope :user_name, -> (user_name) {where(user_name: user_name)}
  
  
  
  
  # def self.search(params)
  #   @reviews = Review.find[params]
  #   json_response(@reviews)
  # end
  
  
  before_save(:titleize)
  private
    def titleize
      self.user_name = self.user_name.titleize
      self.country = self.country.titleize
      self.city = self.city.titleize
    end
end