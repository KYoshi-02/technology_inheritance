class CreateKnowhows < ActiveRecord::Migration[7.1]
  def change
    create_table :knowhows do |t|
      t.string :title
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
