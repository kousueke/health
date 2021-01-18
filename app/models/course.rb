class Course < ApplicationRecord
  belongs_to :user
  # belongs_to :course_name
  validates :weight, numericality: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :course_name
end
