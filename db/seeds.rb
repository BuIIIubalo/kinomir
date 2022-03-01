require 'uri'
require 'net/http'
require 'json'

require 'faker'

movies = Movie.where(:description => nil)

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
  movie.description = Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 10)
  movie.save
end

