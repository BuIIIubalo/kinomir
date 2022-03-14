class Movie < ApplicationRecord

  # Searcher
  include PgSearch::Model
  pg_search_scope :global_search, against: [:name_ru, :name_en, :description]

  # Likes
  has_many :likes, dependent: :destroy
  # Bookmarks
  has_many :bookmarks, dependent: :destroy

  # Comments
  has_many :comments, dependent: :destroy

  # Authors
  has_many :authorships, dependent: :destroy
  has_many :authors, through: :authorships, dependent: :destroy

  # Genres
  has_many :genreships, dependent: :destroy
  has_many :genres, through: :genreships, dependent: :destroy

  # Finding by genre
  def self.in_genres(genre, limit = Movie.count)
    Movie.joins(:genres).where("genres.name" => genre).limit(limit)
  end

  # Movies top by likes
  def self.top_by_likes(limit = Movie.count)
    Movie.left_joins(:likes).having('COUNT(likes.id) > 0').group(:id).order('COUNT(likes.id) DESC').limit(limit)
  end

  # Finding by user id likes
  def self.liked_movies user_id
    Movie.joins(:likes).where("likes.user_id" => user_id)
  end

  # Finding by user id bookmarks
  def self.bookmarked_movies user_id
    Movie.joins(:bookmarks).where("bookmarks.user_id" => user_id)
  end

end
