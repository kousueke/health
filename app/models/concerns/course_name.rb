class CourseName < ActiveHash::Base
  self.data = [
    { id: 1, name: '健康コース' },
    { id: 2, name: 'マッチョコース' },
    { id: 3, name: '超マッチョコース' }
  ]

  include ActiveHash::Associations
  has_many :articles
end