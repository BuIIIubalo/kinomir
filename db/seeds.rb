require 'uri'
require 'net/http'
require 'json'

# Fill db in movies with API
1.upto(50) do |i|

  # API url
  uri = URI('https://videocdn.tv/api/movies')

  # API params
  params = { :api_token => 'MDtifH4V8kokBsgct0Eyy9eQNetxLM7Q',
             :limit => 100,
             :page => i }

  uri.query = URI.encode_www_form(params)

  res = Net::HTTP.get_response(uri)
  res = JSON.parse(res.body)

  # Movie filling and creating
  res['data'].each do |movies|
    Movie.create(kp_id: movies['kinopoisk_id'],
                 imdb_id: movies['imdb_id'],
                 poster_url: 'https://avatars.mds.yandex.net/get-kinopoisk-image/1600647/78c36c0f-aefd-4102-bc3b-bac0dd4314d8/orig',
                 trailer_url: nil ,
                 iframe_url: movies['iframe_src'],
                 name_ru: movies['ru_title'],
                 name_en: movies['orig_title'],
                 description: nil ,
                 year: nil ,
                 film_length: nil ,
                 box_office_world: nil ,
                 rating_kp: nil ,
                 rating_imdb: nil ,
                 recomended: false)
  end
end
