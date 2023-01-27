class Book < ApplicationRecord
  belongs_to :user
  has_many :listings, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :status, acceptance: { accept: ["read", "unfinished", "currently reading", "not read"]}
  validates :pages, numericality: { only_integer: true, allow_nil: true }
end
