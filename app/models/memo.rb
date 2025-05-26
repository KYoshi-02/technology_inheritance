class Memo < ApplicationRecord
  belongs_to :user
  belongs_to :knowhow_post

  validates :content, presence: true
end
