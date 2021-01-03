class Course < ApplicationRecord
  belongs_to :user
  validates :body-weight, numericality
end
