class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :name

      t.timestamps
    end
    add_index :companies, :name, unique: true
  end
end
