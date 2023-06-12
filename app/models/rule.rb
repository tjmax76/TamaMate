class Rule < ActiveHash::Base
  self.data = [
    {id: 1, name: '選択してください'},
    {id: 2, name: '四人東南戦'},
    {id: 3, name: '三人東南戦'},
    {id: 4, name: '四人東風戦'},
    {id: 5, name: '三人東風戦'}
  ]

  include ActiveHash::Associations
  has_many :posts
end