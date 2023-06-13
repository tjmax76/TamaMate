class Post < ApplicationRecord
  validates :room_id, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions 
  validates :rule_id, numericality: { other_than: 1, message: '対局ルールを選択してください' }
  belongs_to :rule
end
