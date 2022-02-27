class CreateGenreships < ActiveRecord::Migration[7.0]
  def change
    create_table :genreships do |t|
      t.belongs_to :genre, null: false, foreign_key: true
      t.belongs_to :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
