class AddContentToAnswers < ActiveRecord::Migration[7.1]
  def change
    add_column :answers, :content, :string
  end
end
