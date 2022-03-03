require 'rest-client'
require 'json'

movies = Movie.all

movies.each do |movie|
  res = RestClient::Request.execute(method: :get, url: "https://kinopoiskapiunofficial.tech/api/v2.2/films/#{movie.kp_id}",
                                                          headers: {'X-API-KEY' => '65c24b28-760a-4ab2-98bc-5ddc8eafe68d'})
  res = JSON.parse(res)

  res['genres'].each do |genre|
    movie.genres << Genre.find_by_name(genre['genre']) if Genre.exists?(name: genre['genre'])
  end

  #movie.update(:trailer_url => res['items'][0]['url'])

  puts movie.id if movie.id % 100 == 0
end
