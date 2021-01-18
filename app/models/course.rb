class Course < ApplicationRecord
  belongs_to :user
  validates :weight, numericality: true
  validates :course_name_id, numericality: { other_than: 1 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :course_name
end
