class RemoveCompanyIdFromQuizzes < ActiveRecord::Migration[7.1]
  def change
    remove_column :quizzes, :company_id, :bigint
  end
end
