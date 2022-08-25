class Book < ApplicationRecord
  # For One Attachments
  has_one_attached :cover_page

  # For Multiple Attachments
  has_many_attached :color_pages
end
