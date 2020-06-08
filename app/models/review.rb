class Review < ApplicationRecord
  validates_presence_of :user_name, :rating, :content, :country, :city
end