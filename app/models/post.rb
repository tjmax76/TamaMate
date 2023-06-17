class Post < ApplicationRecord

  validates :room_number, presence: true, numericality: true, length: {minimum: 5, maximum: 5}
  validates :password, numericality: true, allow_blank: true, length: {minimum: 4}

  extend ActiveHash::Associations::ActiveRecordExtensions 
  validates :rule_id, numericality: { other_than: 1, message: 'を選択してください' }
  belongs_to :rule
end
