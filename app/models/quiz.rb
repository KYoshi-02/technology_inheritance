class Quiz < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_one_attached :image

  validates :question, presence: true
end
