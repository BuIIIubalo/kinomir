class Movie < ApplicationRecord

  include PgSearch::Model
  pg_search_scope :global_search, against: [:name_ru, :name_en, :description]

  has_many :genreships, dependent: :destroy
  has_many :genres, through: :genreships

  def self.in_genres genre
    Movie.joins(:genres).where("genres.name" => genre)
  end

end
