class User < ApplicationRecord
  belongs_to :company
  attr_accessor :company_name
  
  enum role: { general: 0, admin: 1 }

  has_many :knowhows, dependent: :destroy

  has_many :knowhow_posts, dependent: :destroy

  has_many :memos, dependent: :destroy

  has_many :quizzes, dependent: :destroy

  before_validation :assign_company


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  private

  def assign_company
    if company_name.present?
      self.company = Company.find_or_create_by(name: company_name)
    end
  end

end
