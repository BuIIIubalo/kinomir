class Movie < ApplicationRecord
  has_many :categoryships
  has_many :categories, through: :categoryships

  has_many :genreships
  has_many :genres, through: :genreships
end
