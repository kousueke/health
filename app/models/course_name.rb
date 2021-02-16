class CourseName < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 1.2, name: '健康コース' },
    { id: 1.6, name: 'マッチョコース' },
    { id: 2, name: '超マッチョコース' }
  ]

  include ActiveHash::Associations
  has_many :articles
end
