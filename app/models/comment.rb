class Comment < ApplicationRecord
  validates :text, presence: true
  validates :password, numericality: true, allow_blank: true, length: {minimum: 4}

  belongs_to :post
end
