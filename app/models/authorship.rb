class Authorship < ApplicationRecord
  belongs_to :movie
  belongs_to :author
end
