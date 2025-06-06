class CreateMemos < ActiveRecord::Migration[7.1]
  def change
    create_table :memos do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :knowhow_post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
