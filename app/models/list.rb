class List < ApplicationRecord
  belongs_to :user
  has_many :listings, dependent: :destroy
  has_many :books, through: :listings
  validates :name, presence: true
  validates :name, uniqueness: { message: "You have a list named like this"}
end
