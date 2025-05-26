class KnowhowPost < ApplicationRecord
  belongs_to :user

  has_one_attached :image
  has_one_attached :video

  has_many :memos, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
end
