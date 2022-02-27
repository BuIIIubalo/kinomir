class CreateCategoryships < ActiveRecord::Migration[7.0]
  def change
    create_table :categoryships do |t|
      t.belongs_to :category, null: false, foreign_key: true
      t.belongs_to :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
