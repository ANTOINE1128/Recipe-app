class User < ApplicationRecord
  validates :name, presence: true
  has_many :foods, foreign_key: :user_id
end
