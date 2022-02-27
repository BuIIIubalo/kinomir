class Genre < ApplicationRecord
  has_many :genreships
  has_many :movies, through: :genreships
end
