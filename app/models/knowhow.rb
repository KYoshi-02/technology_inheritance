class Knowhow < ApplicationRecord
  belongs_to :user
  belongs_to :company
  validates :title, :content, presence: true
end
