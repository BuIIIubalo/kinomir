class Author < ApplicationRecord
    has_many :authorships
    has_many :movies, through: :authorships
end
