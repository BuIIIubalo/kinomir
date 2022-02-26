class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|

      #ids
      t.string :kp_id
      t.string :imdb_id

      #urls
      t.string :poster_url
      t.string :trailer_url
      t.string :iframe_url

      #metadata
      t.string :name_ru
      t.string :name_en
      t.text :description
      t.integer :year
      t.integer :film_length
      t.integer :box_office_world

      #ratings
      t.float :rating_kp
      t.float :rating_imdb

      #other
      t.boolean :recomended

      t.timestamps
    end
  end
end
