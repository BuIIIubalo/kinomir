require 'rest-client'
require 'json'

movies = Movie.all

# headers: {'api_token' => 'MDtifH4V8kokBsgct0Eyy9eQNetxLM7Q'

# movies.each do |movie|


  # res = RestClient::Request.execute(method: :get, url: "https://kinopoiskapiunofficial.tech/api/v2.2/films/#{movie.kp_id}",
  #                                                 headers: {'X-API-KEY' => '65c24b28-760a-4ab2-98bc-5ddc8eafe68d'})
  # res = JSON.parse(res)
  #
  # puts movie.id
  #
  # movie.update(
  #   poster_url: res['posterUrl'],
  #   description: res['description'],
  #   year: res['year'],
  #   film_length: res['filmLength'],
  #   rating_kp: res['ratingKinopoisk'],
  #   rating_imdb: res['ratingImdb']
  # )
  #
  # genres = res['genres']
  #
  # unless genres.nil?
  #   genres.each do |genre|
  #     unless Genre.exists?(name: genre['genre'])
  #       Genre.create(name: genre['genre'])
  #     end
  #       movie.genres << Genre.find_by_name(genre['genre']) if Genre.exists?(name: genre['genre'])
  #     end
  # end

  # res['genres'].each do |genre|
  #   movie.genres << Genre.find_by_name(genre['genre']) if Genre.exists?(name: genre['genre'])
  # end

  #movie.update(:trailer_url => res['items'][0]['url'])
# end

# Movie Trailer

movies.each do |movie|
  res = RestClient::Request.execute(method: :get, url: "https://kinopoiskapiunofficial.tech/api/v1/staff?filmId=#{movie.kp_id}",
                                                  headers: {'X-API-KEY' => '65c24b28-760a-4ab2-98bc-5ddc8eafe68d'})
  res = JSON.parse(res)
  
  puts res
end

