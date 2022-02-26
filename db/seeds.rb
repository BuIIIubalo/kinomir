
movies = Movie.all
movies.each do |movie|
  movie.poster_url = "https://st.kp.yandex.net/images/film_big/#{movie.kp_id}.jpg"
  movie.save
end