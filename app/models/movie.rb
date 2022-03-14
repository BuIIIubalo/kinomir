class Movie < ApplicationRecord

  include PgSearch::Model
  pg_search_scope :global_search, against: [:name_ru, :name_en, :description]

  has_many :likes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  has_many :comments, dependent: :destroy

  has_many :genreships, dependent: :destroy
  has_many :genres, through: :genreships, dependent: :destroy

  def self.in_genres(genre, limit = Movie.count)
    Movie.joins(:genres).where("genres.name" => genre).limit(limit)
  end

  def self.liked_movies user_id
    Movie.joins(:likes).where("likes.user_id" => user_id)
  end

  def self.bookmarked_movies user_id
    Movie.joins(:bookmarks).where("bookmarks.user_id" => user_id)
  end

end
