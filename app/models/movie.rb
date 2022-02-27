class Movie < ApplicationRecord
  has_many :categoryships
  has_many :categories, through: :categoryships
end
