class Book < ApplicationRecord
  has_one_attached :cover_page
end
