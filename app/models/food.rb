class Food < ApplicationRecord
  # has_many :inventory_foods, foreign_key: 'food_id', dependent: :destroy
  # has_many :recipe_foods, foreign_key: 'food_id', dependent: :destroy

  belongs_to :user, foreign_key: 'user_id'

  validates :name, presence: true, length: { maximum: 50 }
  validates :measurement_unit, presence: true
end
