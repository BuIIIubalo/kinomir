class Category < ApplicationRecord
  has_many :categoryships
  has_many :movies, through: :categoryships
end
