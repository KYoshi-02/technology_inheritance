class Company < ApplicationRecord
  has_many :users, dependent: :destroy

  has_many :knowhows, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
