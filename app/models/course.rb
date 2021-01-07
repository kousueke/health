class Course < ApplicationRecord
  belongs_to :user
  belongs_to :course_name
  validates :body_weight, numericality
end
