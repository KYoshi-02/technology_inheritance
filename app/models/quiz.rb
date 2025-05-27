class Quiz < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :answers, dependent: :destroy
end
