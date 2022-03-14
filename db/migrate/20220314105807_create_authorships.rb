class CreateAuthorships < ActiveRecord::Migration[7.0]
  def change
    create_table :authorships do |t|
      t.belongs_to :movie, null: false, foreign_key: true
      t.belongs_to :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
