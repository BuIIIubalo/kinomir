class Like < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  scope :newest, -> { order(created_at: :asc) }

end
