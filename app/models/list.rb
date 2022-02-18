class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  validates :image_url, presence: true
  validates :name, presence: true, uniqueness: true
end
