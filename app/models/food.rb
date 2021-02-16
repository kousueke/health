class Food < ApplicationRecord
  belongs_to :user
  belongs_to :course

  with_options presence: true do
    validates :name
    validates :amount_of_protein
    validates :number
  end
end
