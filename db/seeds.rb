require 'uri'
require 'net/http'
require 'json'


movies = Movie.all

movies.each do |movie|
  movie.categories << Category.offset(rand(Category.count)).first
  movie.save
end
