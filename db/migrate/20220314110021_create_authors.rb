class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.integer :staffId
      t.string :nameRu
      t.string :nameEn
      t.string :description
      t.string :posterUrl
      t.string :professionText

      t.timestamps
    end
  end
end
