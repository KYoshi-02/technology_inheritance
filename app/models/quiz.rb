class Quiz < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :answers, dependent: :destroy

  validates :question, :correct_answer, presence: true
end
