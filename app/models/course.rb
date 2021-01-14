class Course < ApplicationRecord
  belongs_to :user
  belongs_to :course_name
  validates :weight, numericality: true
end
