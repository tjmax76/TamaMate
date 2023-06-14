class Post < ApplicationRecord

  validates :room_number, presence: true, numericality: { message: "数字を入力してください"}, length: {minimum: 5}
  validates :password, numericality: { message: "数字を入力してください"}, length: {minimum: 4}

  extend ActiveHash::Associations::ActiveRecordExtensions 
  validates :rule_id, numericality: { other_than: 1, message: '対局ルールを選択してください' }
  belongs_to :rule
end
