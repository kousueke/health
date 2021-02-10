class Course < ApplicationRecord
  belongs_to :user
  # belongs_to :food
  
  with_options presence: true do
  validates :weight, numericality: true
  validates :course_name_id, numericality: { other_than: 1 }
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :course_name
end
