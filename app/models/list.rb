class List < ApplicationRecord
  belongs_to :user
  has_many :listings
  has_many :books, through: :listings
end
