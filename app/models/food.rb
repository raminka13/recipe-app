class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, inverse_of: 'food', foreign_key: 'food_id', dependent: :destroy

  validates :name, presence: true, length: { maximum: 18 }
  validates :measurement_unit, presence: true, length: { maximum: 9 }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
