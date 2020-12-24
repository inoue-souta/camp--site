class CreateCamps < ActiveRecord::Migration[6.0]
  def change
    create_table :camps do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :text
      t.string :category
      t.timestamps
    end
  end
end
