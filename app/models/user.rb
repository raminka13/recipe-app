class User < ApplicationRecord
  has_many :recipes, inverse_of: 'user', foreign_key: 'user_id', dependent: :destroy
  has_many :foods, inverse_of: 'user', foreign_key: 'user_id', dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { maximum: 27 }
end
