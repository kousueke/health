class Course < ApplicationRecord
  belongs_to :user
  belongs_to :course_name_id
  validates :weight, numericality: true
end
