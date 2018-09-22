class Response < ApplicationRecord
  validates :content, presence: true, length: {in: 1..140}

  belongs_to :contact
  belongs_to :user
end