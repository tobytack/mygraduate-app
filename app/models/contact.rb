class Contact < ApplicationRecord
  validates :title, presence: true, length: {in: 1..500 }
  validates :content, presence: true, length: {in: 1..500}

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  has_many :responses, dependent: :destroy
  
  mount_uploader :image, ImageUploader
end