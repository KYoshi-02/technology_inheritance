class AddExplanationToQuizzes < ActiveRecord::Migration[7.1]
  def change
    add_column :quizzes, :explanation, :text
  end
end
