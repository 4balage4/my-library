class Listing < ApplicationRecord
  belongs_to :book
  belongs_to :list
  validates :book_id, uniqueness: {scope: :list_id, message: "You already have this on the list" }
  # validates_uniqueness_of :book_id, scope: :list_id, { message: }
end
