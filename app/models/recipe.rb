class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, inverse_of: 'recipe', foreign_key: 'recipe_id', dependent: :destroy

  validates :name, presence: true, length: { maximum: 18 }
  validates :preparation_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cooking_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true, length: { maximum: 450 }
end
