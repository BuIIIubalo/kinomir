class Movie < ApplicationRecord
  has_many :categoryships
  has_many :categories, through: :categoryships

  has_many :genreships
  has_many :genres, through: :genreships

  def self.search(search)
    where("lower(name_ru) LIKE :search OR lower(name_en) LIKE :search", search: "%#{search.downcase}%")
  end

end
