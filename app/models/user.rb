class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :recipes, inverse_of: 'user', foreign_key: 'user_id', dependent: :destroy
  has_many :foods, inverse_of: 'user', foreign_key: 'user_id', dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { maximum: 27 }
end
