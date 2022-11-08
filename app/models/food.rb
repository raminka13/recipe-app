class Food < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 18 }
  validates :measurement_unit, presence: true, length: { maximum: 9 }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
