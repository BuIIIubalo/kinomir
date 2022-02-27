require 'uri'
require 'net/http'
require 'json'


movies = Movie.all

# movies.each do |movie|
#   movie.year = rand(1950..2022)
#   movie.film_length = rand(70..220)
#   movie.rating_kp = rand(2..10)
#   movie.rating_imdb = rand(2..10)
#   movie.box_office_world = rand(1000000..1000000000)
#
#   movie.save
# end

movies.each do |movie|
  movie.genres << Genre.offset(rand(Genre.count)).first
end